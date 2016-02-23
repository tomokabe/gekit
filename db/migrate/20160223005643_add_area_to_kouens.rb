class AddAreaToKouens < ActiveRecord::Migration
  def change
    add_column :kouens, :area, :string
  end
end
