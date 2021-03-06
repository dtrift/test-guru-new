class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy

  validates_uniqueness_of :title, scope: :level
  validates :level, :passage_timer, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :level, ->(level) { where(level: level) }
  scope :category, ->(c_title) { joins(:category)
    .where(categories: {title: c_title}) }

  def desc_category_title
    category.order(title: :desc).pluck(:title)
  end
end
