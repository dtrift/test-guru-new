class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def call
    Badge.all.select { |badge| send badge.rule, badge }
  end

  private

  def category_tests_complete?(badge)
    category = badge.rule_value
    date = date_last_received_badge(badge)
    category_id = @test.category.id
    @test.category[:title] == category &&
    test_successful_complete? &&
    Test.category(category).count == user_successful_test_passages( { category_id: category_id }, date).uniq.count
  end

  def level_tests_complete?(badge)
    level_test = badge.rule_value
    date = date_last_received_badge(badge)
    @test.level == level_test &&
    test_successful_complete? &&
    Test.level(level_test).count == user_successful_test_passages( { level: level_test }, date).uniq.count
  end

  def first_try_complete?(first_try)
    test_successful_complete? &&
    TestPassage.where(user: @user, test: @test).count == 1
  end

  def test_successful_complete?
    @test_passage.score_positive?
  end

  def user_successful_test_passages(value, date)
    @user.test_passages.successful.after_date(date)
      .joins(:test).where(tests: value)
  end

  def date_last_received_badge(badge)
    @user.user_badges.where(badge: badge).order(created_at: :asc).last&.created_at || 0
  end
end
