class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :count, on: :create

  scope :correct, -> { where(correct: true) }

  private
  
  def count
    errors.add(:category_id, 'Количество ответов для одного вопроса от 1 до 4') if question.answers.count >= 4
  end
end
