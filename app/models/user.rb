class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :user_id
  has_many :gists

  validates :first_name, presence: true 

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable, 
         :validatable,
         :confirmable,
         :trackable

  def all_tests(level_test)
    tests.where(level: level_test)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end
end
