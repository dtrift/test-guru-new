class User < ApplicationRecord
  def all_tests(level_test)
    Test.where('level = :level AND id = :user_test_id', level: level_test, user_test_id: self.test_id)
  end
end
