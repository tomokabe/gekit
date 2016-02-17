class CreateKouens < ActiveRecord::Migration
  def change
    create_table :kouens do |t|
     t.string :title
     t.string :gekidan
     t.string :writer
     t.string :director
     t.text :cast
     t.text :detail
     t.text :nichiji
     t.string :basho
     t.text :image_url
     t.timestamps 
    end
  end
end
