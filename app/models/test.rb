class Test < ApplicationRecord
  def self.category_title_desc(title)
    order(title: :desc).pluck(:title)
  end
end
