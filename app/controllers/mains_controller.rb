class MainsController < ApplicationController
  before_action :set_main, only: %i[ show edit update destroy ]
  after_action :set_todo_user_id, only: %i[ create update ]

  # GET /mains or /mains.json
  def index
    @mains = Main.where(user_id: current_user.id).order(vol: :desc)
  end

  # GET /mains/1 or /mains/1.json
  def show
    @todos = []
    todo_ids = []
    ToDo.where(main_id: @main.id).each do |todo|
      @todos.push(todo)
      todo_ids.push(todo.id)
    end
    ToDo.where(is_finished: false).where(user_id: current_user.id).each do |todo|
      unless todo_ids.include?(todo.id)
        @todos.push(todo)
      end
    end
    @todos.sort!{|a,b| a.time_limit.nil? ? 1 : (b.time_limit.nil? ? -1 : (a.time_limit <=> b.time_limit))}
  end

  # GET /mains/new
  def new
    @main = Main.new
    @main.to_dos.build
    @main.points.build
    @main.what_to_dos.build
    @main.learned_lists.build
  end

  # GET /mains/1/edit
  def edit
  end

  # POST /mains or /mains.json
  def create
    @main = Main.new(main_params)
    @main.user_id = current_user.id
    current_user.vol = current_user.vol + 1
    current_user.save

    @main.vol = current_user.vol

    respond_to do |format|
      if @main.save
        format.html { redirect_to main_url(@main), notice: "Main was successfully created." }
        format.json { render :show, status: :created, location: @main }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @main.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mains/1 or /mains/1.json
  def update
    respond_to do |format|
      if @main.update(main_params)
        format.html { 
          if validate_main
            redirect_to main_url(@main), notice: "Main was successfully updated."
          else
            render :edit, status: :unprocessable_entity
          end
        }
        format.json { render :show, status: :ok, location: @main }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @main.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mains/1 or /mains/1.json
  def destroy
    @main.destroy!

    respond_to do |format|
      format.html { redirect_to mains_url, notice: "Main was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def send_mail
    UserMailer.nippou_email(params, current_user.email).deliver_now
    redirect_to redirect_path(url: "https://atnd.ak4.jp/ja/login?next=%2Fja%2Fsp%2Fmypage%2Fpunch", msg:"打刻も忘れずに！")
  end

  def redirect
    render :layout => 'redirect'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main
      @main = Main.find(params[:id])
      if @main.user_id != current_user.id
        redirect_to mains_path
      end
    end

    # Only allow a list of trusted parameters through.
    def main_params
      params.require(:main).permit(:title, :first_comment, :second_comment, to_dos_attributes: [:id, :name, :time_limit], points_attributes: [:id, :text, :is_good], what_to_dos_attributes: [:id, :name, :from_time, :to_time], learned_lists_attributes: [:id, :text, :is_learned])
    end

    def set_todo_user_id
      @main.to_dos.each do |todo|
        todo.user_id = current_user.id
        todo.save
      end
    end

    def validate_main
      errors = []
      ret = true
      if @main.learned_lists.where(is_learned: 0).length == 0
        errors = errors | ["学んだことを入力してください。"]
        ret = false
      end
      if @main.learned_lists.where(is_learned: 1).length == 0
        errors = errors | ["感じたことを入力してください。"]
        ret = false
      end
      @main.what_to_dos.each do |w|
        if w.from_time.nil?
          errors = errors | ["業務内容の開始時間を入力してください。"]
          ret = false
        end
        if w.to_time.nil?
          errors = errors | ["業務内容の終了時間を入力してください。"]
          ret = false
        end
      end
      @main.to_dos.each do |t|
        if t.time_limit.nil?
          errors = errors | ["やりたいことの期限を入力してください。"]
          ret = false
        end
      end
      @errors = errors
      return ret
    end
end
