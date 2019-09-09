class Test < ApplicationRecord
  has_many :user_tests
  has_many :users, through: :user_tests
  has_many :questios
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  def self.desc_category_title(c_title)
    joins("JOIN categories ON tests.category_id = categories.id")
      .where(categories: {title: c_title}).order(title: :desc).pluck(:title)
  end
end
