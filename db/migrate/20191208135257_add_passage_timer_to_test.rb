class AddPassageTimerToTest < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :passage_timer, :integer, null: false, default: 0
  end
end
