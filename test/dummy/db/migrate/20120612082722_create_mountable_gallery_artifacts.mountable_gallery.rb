# This migration comes from mountable_gallery (originally 20120605111739)
class CreateMountableGalleryArtifacts < ActiveRecord::Migration
  def change
    create_table :mountable_gallery_artifacts do |t|
      t.string :title
      t.string :sid
      t.string :file
      t.string :icon
      t.string :type
      t.text :caption
      t.timestamps
    end
  end
end
