class Test < ApplicationRecord
  def self.category_title_desc(c_title)
    Catergory.where('title = :title', title: c_title).order(title: :desc).pluck(:title)
  end
  # def self.category_title_desc(c_title)
  #   Category.where('title', title: c_title).order(title: :desc).pluck(:title)
  # end
  # def self.category_title_desc(title)
  #   order(title: :desc).pluck(:title)
  # end
end
