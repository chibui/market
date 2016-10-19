class ModelMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_seller_notification.subject
  #
  def new_seller_notification(user)
    @user = user
    mail to: "chi_bui@outlook.com", subject: "Success!"
  end

end
