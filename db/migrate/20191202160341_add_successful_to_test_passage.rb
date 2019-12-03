class AddSuccessfulToTestPassage < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :successful, :boolean, default: false
  end
end
