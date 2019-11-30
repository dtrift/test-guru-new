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
    Test.where(category: @test.category).count == @user.tests.category(@test.category).uniq.count 
  end

  def badge_first_try_received?
    TestPassage.where(user: @user, test: @test).count == 1
  end

  def level_reward_received?(level_test)
    Test.where(level: level_test).count == @user.tests.level(level_test).uniq.count
  end

  def get_badge(badge)
    @badges << badge
  end

  def badge_recived?(value)
    @user.badges.find_by(value).present?
  end
end
