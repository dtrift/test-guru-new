class FeedbacksMailer < ApplicationMailer
  def send(feedback)
    @feedback = feedback

    # mail to: 'tn.timur.g@gmail.com'
    mail to: Admin.pluck(:email)
  end
end
