class FeedbacksMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) },
          from: @user_email
        
  def send_feedback(feedback)
    @user_name = feedback.user_name
    @user_email = feedback.user_email
    @message = feedback.body

    mail
  end
end
