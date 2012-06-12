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
