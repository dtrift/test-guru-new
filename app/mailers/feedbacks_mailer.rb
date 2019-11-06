class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback)
    @user_name = feedback.user.first_name
    @user_email = feedback.user.email
    @message = feedback.body

    # mail to: 'tn.timur.g@gmail.com'
    # mail to: Admin.pluck(:email)
    mail to: @user_email
  end
end
