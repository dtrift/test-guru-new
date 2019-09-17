class QuestionsController < ApplicationController
  def index
    render json: { questions: Question.all }
    # render plain: 'All Questions'
  end

  def show
    # render plain: 'Some Question'
  end

  def new
    
  end

  def create
    # result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    # render plain: result.join("\n")
    question = Question.create(question_params)
    render plain: question.inspect
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end
end
