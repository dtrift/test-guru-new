class AddTestsLevelDefaultConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tests, :level, from: nil, to: false
  end
end
