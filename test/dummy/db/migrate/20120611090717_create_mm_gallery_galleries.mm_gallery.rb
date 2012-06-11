# This migration comes from mm_gallery (originally 20120605112411)
class CreateMmGalleryGalleries < ActiveRecord::Migration
  def change
    create_table :mm_gallery_galleries do |t|
      t.string :title
      t.string :sid
      t.string :description

      t.timestamps
    end
  end
end
