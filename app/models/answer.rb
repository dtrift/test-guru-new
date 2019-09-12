class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :count, on: :create

  scope :correct, -> { whhere(correct: true) }

  private
  
  def count
    errors.add(:category_id) if question.answers.count > 4
  end
end
