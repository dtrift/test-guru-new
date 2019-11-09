class FeedbacksMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) },
          from: 'notification@test-guru-tim.herokuapp.com'
        
  def send_feedback(feedback)
    @user_name = feedback.user_name
    @user_email = feedback.user_email
    @message = feedback.body

    mail
  end
end
