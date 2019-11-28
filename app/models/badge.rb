class Badge < ApplicationRecord
  RULES = [
    [I18n.t('.complete_level_tests'), :complete_level_tests],
    [I18n.t('.complete_firts_try'), :complete_firts_try],
    [I18n.t('.complete_category_tests'), :complete_category_tests]
  ].freeze

  has_many :user_badges, dependent: :nullify
  has_many :users, through: :user_badges

  validates :name, :picture_path, :rule, presence: true
end
