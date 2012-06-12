# This migration comes from mountable_gallery (originally 20120605112411)
class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :sid
      t.string :description

      t.timestamps
    end
  end
end
