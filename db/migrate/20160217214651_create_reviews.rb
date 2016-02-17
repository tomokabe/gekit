class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :user_id
      t.string :kouen_id
      t.string :gekidan
      t.string :title
      t.text :review
      t.timestamps
    end
  end
end
