class DropTableFeedback < ActiveRecord::Migration[5.2]
  def change
    drop_table :feedbacks
  end
end
