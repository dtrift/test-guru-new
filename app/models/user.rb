class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  def all_tests(level_test)
    Test.joins("JOIN user_tests ON tests.id = user_tests.test_id")
      .where(level: level_test, user_tests: {user_id: id})
  end
end
