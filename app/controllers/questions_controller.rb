class QuestionsController < ApplicationController
  before_action :find_question, only: %i[index show edit update destroy]
  before_action :find_test, only: %i[new create destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
  end

  def show
    # @question_answers = @qustion.answers
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.create!(question_params)

    if @question.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
   if @question.update(question_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @test
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
