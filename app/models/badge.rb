class Badge < ApplicationRecord
  RULES = [
    [I18n.t('.complete_level_tests'), :level_tests_complete],
    [I18n.t('.complete_first_try'), :first_try_complete],
    [I18n.t('.complete_category_tests'), :category_tests_complete]
  ].freeze

  has_many :user_badges, dependent: :nullify
  has_many :users, through: :user_badges

  validates :name, :picture_path, :rule, presence: true
end
