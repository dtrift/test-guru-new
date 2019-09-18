class QuestionsController < ApplicationController
  before_action :find_question

  def index
    render json: { questions: Question.all }
  end

  def show
    render inline: '<%= @question.body %>'
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

  def find_question
    @question = Question.find(params[:id])
  end
end
