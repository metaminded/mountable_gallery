# This migration comes from mountable_gallery (originally 20120605112411)
class CreateMountableGalleryGalleries < ActiveRecord::Migration
  def change
    create_table :mountable_gallery_galleries do |t|
      t.string :title
      t.string :sid
      t.string :description

      t.timestamps
    end
  end
end
