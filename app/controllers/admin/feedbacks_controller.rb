class Admin::FeedbacksController < Admin::BaseController
  before_action :find_feedback, only: %i[show]

  def index
    @feedbacks = Feedback.all
  end

  def show; end

  private

  def find_feedback
    @feedback = Feedback.find(params[:id])
  end
end
