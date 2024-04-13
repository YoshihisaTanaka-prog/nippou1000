class UserMailer < ApplicationMailer
  def nippou_email(param)
    @text = param[:text]
    mail(to: current_user.email, subject: param[:title])
  end
end
