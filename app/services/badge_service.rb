class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def call
    Badge.all.select { |badge| send "#{badge.rule}", badge.rule_value }
  end

  private

  def category_tests_complete?(category)
    @test.category[:title] == category &&
    test_successful_complete? &&
    badge_received?(rule_value: category) &&
    category_id = Category.where(title: category)
    Test.category(category).count == user_successful_test_passages(category_id: category_id).uniq.count
  end

  def level_tests_complete?(level_test)
    @test.level == level_test &&
    test_successful_complete? &&
    badge_received?(rule_value: level_test) &&
    Test.level(level_test).count == user_successful_test_passages(level: level_test).uniq.count
  end

  def first_try_complete?(first_try)
    test_successful_complete? &&
    TestPassage.where(user: @user, test: @test).count == 1
  end

  def badge_received?(value)
    @user.badges.find_by(value).nil?
  end

  def test_successful_complete?
    @test_passage.score_positive?
  end

  def user_successful_test_passages(value)
    @user.test_passages.successful.joins(:test).where(tests: value)
  end
end
