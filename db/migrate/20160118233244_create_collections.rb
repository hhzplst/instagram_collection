class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :username
      t.string :link
      t.string :created_time
      t.string :image
      t.string :video

      t.timestamps null: false
    end
  end
end
