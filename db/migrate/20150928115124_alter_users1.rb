class AlterUsers1 < ActiveRecord::Migration
  def change
    add_column :users, :sex, :integer
  end
end
