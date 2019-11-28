class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def call
    if @test_passage.score_positive?
      Badge.all.each do |badge|
        case badge.rule
        when 'category_backend'
          reward(badge) if badge_category_backend_received?
        when 'first_try'
          reward(badge) if badge_first_try_received?
        when 'level_1'
          reward(badge) if level_reward_received?(1)
        when 'level_2'
          reward(badge) if level_reward_received?(2)
        when 'level_3'
          reward(badge) if level_reward_received?(3)
        end
      end
    end
  end

  private

  def badge_category_backend_received?
    Test.where(category: @test.category).count == @user.tests.where(category: @test.category).uniq.count 
  end

  def badge_first_try_received?
    TestPassage.where(user: @user, test: @test).count == 1
  end

  def level_reward_received?(level_test)
    Test.where(level: level_test).count == @user.tests.level(level_test).uniq.count
  end

  def reward(badge)
    @user.badges << badge
  end
end
