class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable, 
         :validatable,
         :confirmable,
         :trackable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :user_id

  # validates :name, :email, presence: true 
  # validates :email, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/, uniqueness: true

  def all_tests(level_test)
    tests.where(level: level_test)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
