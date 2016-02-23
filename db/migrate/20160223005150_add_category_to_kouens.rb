class AddCategoryToKouens < ActiveRecord::Migration
  def change
    add_column :kouens, :category, :string
  end
end
