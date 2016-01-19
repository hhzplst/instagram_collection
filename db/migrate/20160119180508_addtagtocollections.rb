class Addtagtocollections < ActiveRecord::Migration
  def change
    add_column :collections, :tag, :string
  end
end
