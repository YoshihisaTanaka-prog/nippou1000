class UserMailer < ApplicationMailer
  def nippou_email(param, email)
    @text = param[:text]
    mail(to: email, subject: param[:title])
  end
end
