class ApplicationController < ActionController::Base

  before_action :confirm_user, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initial_set, unless: :devise_controller?

  protected

  def initial_set
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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :kana, :sign, :affiliation, :grade ,:first_person_id, :vol])
    devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
  end

end
