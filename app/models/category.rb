class Category < ApplicationRecord
  has_many :tests, dependent: :nullify

  validates :title, precence: true

  default_scope { where(title: :asc) }
end
