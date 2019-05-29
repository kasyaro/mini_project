class AddForeignKeyToReviews < ActiveRecord::Migration[5.2]
  def change

    add_column :reviews, :coffee_id, :integer
  end
end
