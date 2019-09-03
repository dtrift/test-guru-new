class User < ApplicationRecord
  def all_tests(test_level)
    Tests.where('level = level AND self.test_id = tests.id', level: test_level)
  end
end
