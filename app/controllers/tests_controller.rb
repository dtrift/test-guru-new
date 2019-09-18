class TestsController < ApplicationController
  def index
    render json: { tests: Test.all }
  end

  def show

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
end
