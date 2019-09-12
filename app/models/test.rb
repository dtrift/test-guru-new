class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests
  has_many :questions, dependent: :destroy

  validates :title, :level, presence: true
  validates :title, :level, uniqueness: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :desc_category_title, ->(c_title) { categories.where(title: c_title)
    .order(title: :desc).pluck(:title) }

  # def self.desc_category_title(c_title)
  #   joins(:category).where(categories: {title: c_title})
  #     .order(title: :desc).pluck(:title)
  # end
end
