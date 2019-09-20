class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
    # render json: { tests: @tests.pluck(:title) }
  end

  def show
    @test = Test.find(params[:id])
    # render inline: '<%= @test.title %>'
  end

  def new; end

  def create
    @test = Test.create!(test_params)

    render plain: @test.inspect
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end
