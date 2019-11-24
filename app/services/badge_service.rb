class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  private

  def badge_category_backend_received?
    Test.where(category: 'backend').count == @user.tests.desc_category('backend').uniq.count 
  end

  def badge_first_try_received?
    
  end

  def level_reward_received?(level_test)
    
  end

end
