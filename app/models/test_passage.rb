class TestPassage < ApplicationRecord
  POSITIVE_SCORE = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def index_current_question
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def score
    (100 / test.questions.count).to_f * correct_questions
  end

  def score_positive?
    score >= POSITIVE_SCORE
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def next_question
    if new_record?
      self.current_question = test.questions.first
    else
      self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end