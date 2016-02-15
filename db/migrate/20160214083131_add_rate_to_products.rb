class AddRateToProducts < ActiveRecord::Migration
  def change
    add_column :kouens, :gekidan, :string
    add_column :kouens, :writer, :string
    add_column :kouens, :director, :string
    add_column :kouens, :cast, :string
    add_column :kouens, :detail, :text
    add_column :kouens, :nichiji, :text
    add_column :kouens, :basho, :string
  end
end
