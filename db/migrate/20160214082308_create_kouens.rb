class CreateKouens < ActiveRecord::Migration
  def change
    create_table :kouens do |t|
      t.string :title
      t.text :image_url
      t.timestamps 
    end
  end
end
