class TestsController < ApplicationController
  before_action :find_test

  def index
    render json: { tests: Test.all }
  end

  def show
    render inline: '<%= @test.title %>'
  end

  def new
    
  end

  def create
    test = Test.create!(test_params)

    render plain: test.inspect
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
