class Test < ApplicationRecord
  def self.desc_category_title(c_title)
    joins("INNER JOIN categories ON tests.category_id = categories.id")
      .where(categories: {title: c_title}).order(title: :desc).pluck(:title)
  end
end
