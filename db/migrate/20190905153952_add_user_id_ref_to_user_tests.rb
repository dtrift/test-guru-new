class AddUserIdRefToUserTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_tests, :user, foreign_key: true
  end
end
