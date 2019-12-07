class AddRuleToBadge < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :rule, :string, null: false
  end
end
