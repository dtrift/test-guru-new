class Badge < ApplicationRecord
  RULES = %i[
    level_tests_complete?
    first_try_complete?
    category_tests_complete?
  ].freeze

  has_many :user_badges, dependent: :nullify
  has_many :users, through: :user_badges

  validates_uniqueness_of :rule, scope: :rule_value
  validates :name, :picture_path, :rule, presence: true
  validates :rule, inclusion: { in: RULES.map(&:to_s) }
end
