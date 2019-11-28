class BadgeService
  attr_reader :badges

  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
    @badges = []
  end

  def call

  end

  private

  def badge_category_received?
    Test.where(category: @test.category).count == @user.all_tests_by_category(@test.category).uniq.count 
  end

  def badge_first_try_received?
    TestPassage.where(user: @user, test: @test).count == 1
  end

  def level_reward_received?(level_test)
    Test.where(level: level_test).count == @user.all_tests_by_level(level_test).uniq.count
  end

  def reward(badge)
    @badges << badge
  end
end
