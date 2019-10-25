class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user
  
  validates :html_url, presence: :true
end
