class AlterGenre1 < ActiveRecord::Migration
  def change
    remove_column :genres, :book_id
  end
end
