class ChangeDateToBeDateInEvents < ActiveRecord::Migration[7.0]
  def up
    change_column :events, :date, :date
  end

  def down
    change_column :events, :date, :string
  end
end
