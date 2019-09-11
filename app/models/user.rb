class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests
  has_many :created_tests, class_name: "Test"

  validates :name, :email, presence: true

  scope :all_tests, ->(level_test) { tests.where(level: level_test) }

  # def all_tests(level_test)
  #   tests.where(level: level_test)
  # end
end
