class AddTestIdRefToUserTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_tests, :test, foreign_key: true
  end
end
