class User < ApplicationRecord
  def all_tests(level_test)
    Test.joins("INNER JOIN user_tests ON tests.id = user_tests.test_id")
      .where(level: level_test, user_tests: {user_id: id})
  end
end
