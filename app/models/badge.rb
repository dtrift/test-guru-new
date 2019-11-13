class Badge < ApplicationRecord
  validates :name, :picture_path, presence: true
end
