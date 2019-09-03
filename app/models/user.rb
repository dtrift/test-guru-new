class User < ApplicationRecord
  def all_tests(test_level)
    Test.where(level: test_level)
  end
end
