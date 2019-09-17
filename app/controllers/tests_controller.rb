class TestsController < ApplicationController
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
    test = Test.create(test_params)
    render plain: test.inspect
  end

  private

  def question_params
    params.require(:test).permit(:body, :level)
  end
end
