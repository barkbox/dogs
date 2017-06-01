class CreateDogsTable < ActiveRecord::Migration
  def change
    create_table :dogs_tables do |t|
      t.integer :bark_user_id
      t.string :name
      t.datetime :birthday
      t.string :size
      t.string :image_url
      
      t.timestamps
    end
  end
end
