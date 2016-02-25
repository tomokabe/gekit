class RemoveGekidanFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :gekidan, :string
  end
end
