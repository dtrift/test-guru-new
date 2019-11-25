class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  private

  def badge_category_backend_received?
    Test.where(category: 'backend').count == @user.tests.category('backend').uniq.count 
  end

  def badge_first_try_received?
    TestPassage.where(user: @user, test: @test).count == 1
  end

  def level_reward_received?(level_test)
    
  end
end
