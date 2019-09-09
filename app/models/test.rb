class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests, dependent: :destroy
  has_many :questios, dependent: :destroy

  def self.desc_category_title(c_title)
    joins(:category).where(categories: {title: c_title})
      .order(title: :desc).pluck(:title)
  end
end
