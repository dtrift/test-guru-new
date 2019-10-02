class AddQuestionIdRefToUserTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_tests, :question, foreign_key: true
  end
end
