class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests, dependent: :destroy
  has_many :author, class_name: "Test", foreign_key: "user_id"

  def all_tests(level_test)
    Test.joins(:user_tests).where(level: level_test, user_tests: {user_id: id})
  end
end
