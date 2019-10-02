class AddCorrectQuestionsToUserTests < ActiveRecord::Migration[5.2]
  def change
    add_column :user_tests, :correct_questions, :integer, default: 0
  end
end
