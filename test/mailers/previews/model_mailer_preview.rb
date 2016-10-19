# Preview all emails at http://localhost:3000/rails/mailers/model_mailer
class ModelMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/model_mailer/new_seller_notification
  def new_seller_notification
    ModelMailer.new_seller_notification
  end

end
