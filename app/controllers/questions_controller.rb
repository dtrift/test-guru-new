class QuestionsController < ApplicationController
  def index
    render json: { questions: Question.all }
  end

  def show

  end

  def new

  end

  def create
    question = Question.create!(question_params)

    render plain: question.inspect
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
