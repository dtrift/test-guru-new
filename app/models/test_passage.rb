class TestPassage < ApplicationRecord
  POSITIVE_SCORE = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question, on: :update

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def index_current_question
    test.questions.index(current_question) + 1
  end

  def score
    (100 / test.questions.count) * correct_questions
  end

  def score_positive?
    score >= POSITIVE_SCORE
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  # def score
  #   (100 / test.questions.count) * correct_questions
  # end
end
