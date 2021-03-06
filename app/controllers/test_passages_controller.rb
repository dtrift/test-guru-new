class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      
      badge_service = BadgeService.new(@test_passage)
      current_user.badges << badge_service.call

      # TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    gist = service.call

    if service.success?
      Gist.create(user: @test_passage.user, question: @test_passage.current_question, html_url: gist[:html_url])

      flash[:notice] = view_context.link_to t('.success'), gist[:html_url], target: :blank
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def find_test_passage
   @test_passage = TestPassage.find(params[:id])
  end
end
