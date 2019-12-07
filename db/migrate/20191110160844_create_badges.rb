class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :picture_path, null: false

      t.timestamps
    end
  end
end
