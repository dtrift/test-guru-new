class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def call
    Badge.all.select { |badge| send "#{badge.rule}?", badge.rule_value }
  end

  private

  def category_tests_complete?(category)
    category_id = Category.where(title: category)
    test_complete? &&
    @test.category[:title] == category &&
    badge_received?(rule_value: category) &&
    
    # Test.category(category).count == @user.tests.category(category).uniq.count
  end

  def first_try_complete?(first_try)
    test_complete? &&
    TestPassage.where(user: @user, test: @test).count == 1
  end

  def level_tests_complete?(level_test)
    test_complete? &&
    badge_received?(rule_value: level_test) &&    
    Test.level(level_test).count == @user.tests.level(level_test).uniq.count
  end

  def badge_received?(value)
    @user.badges.find_by(value).nil?
  end

  def test_complete?
    @test_passage.score_positive?
  end
end
