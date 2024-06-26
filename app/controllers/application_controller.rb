class ApplicationController < ActionController::Base

  before_action :confirm_user, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initial_set, unless: :devise_controller?

  protected

  def after_sign_up_path_for(resource)
    root_path
  end

  def initial_set
    if current_user.is_shared_zoho.nil?
      current_user.is_shared_zoho = true
      current_user.save
      send_to_zoho_forms
    end
    @basic_first_people = []
    FirstPerson.where.not(id: current_user.first_person_id).each do |fp|
      @basic_first_people.push(fp.name)
    end
    if session[:did_alert_akashi].nil?
      session[:did_alert_akashi] = false
    end
  end

  def confirm_user
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def configure_permitted_parameters
    # ユーザー名の編集を許可する場合
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :kana, :sign, :affiliation, :grade ,:first_person_id, :vol])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :kana, :sign, :affiliation, :grade ,:first_person_id, :vol, :is_shareable_zoho])
  end

    def send_to_zoho_forms
      if current_user.is_shareable_zoho
        logger.info "Shareing to Zoho"
        options = Selenium::WebDriver::Chrome::Options.new
        options.add_argument('--headless')
        session = Selenium::WebDriver.for :chrome, options: options
        # 10秒待っても読み込まれない場合は、エラーが発生する
        session.manage.timeouts.implicit_wait = 10
        # ページ遷移する
        session.get "https://forms.zohopublic.jp/yoshihiserver/form/Untitled/formperma/fJgNGwOnV0cZxK2VT98_3TckzIsOXw65jSHDIEEMHYU?referrername=nippou1000"
        sleep(2)
        # 自動入力する
        session.find_elements(:name, 'Name').each do |element|
          logger.info "test-loop1"
          element.send_keys(current_user.kana)
        end
        session.find_element(:id, 'Email-arialabel').send_keys(current_user.email)
        session.find_element(:id, 'SingleLine-arialabel').send_keys(current_user.affiliation)
        # 送信
        session.find_elements(:tag_name, 'button').each do |element|
          if element.displayed? && element.enabled?
            element.click
          end
        end
        # ブラウザを終了
        session.quit
      end
    end

end
