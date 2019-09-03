class Test < ApplicationRecord
  def self.category_title_desc_sort(sort_title)
    self.order(title: :desc).pluck(:sort_title)
  end
end
