require 'digest/sha1'

class User < ApplicationRecord
  include Auth

  has_secure_password

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :user_id

  def all_tests(level_test)
    tests.where(level: level_test)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
