class TestPassage < ApplicationRecord
  POSITIVE_SCORE = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  scope :successful, -> { where(successful: true) }
  scope :after_date, ->(date) { where('created_at > ?', date) }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    successful!
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

  def progress
    ((index_current_question - 1).to_f / test.questions.count * 100).round(2)
  end

  def score_positive?
    score >= POSITIVE_SCORE
  end

  def time_out?
    remaining_time <= 0 if time_limit?
  end

  def time_limit?
    test.passage_timer.present?
  end

  def remaining_time
    ((created_at + test.passage_timer.minutes) - Time.current).to_i
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
  
  def successful!
    self.successful = score_positive?
  end
end
