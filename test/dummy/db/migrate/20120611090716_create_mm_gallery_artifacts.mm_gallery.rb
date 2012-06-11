# This migration comes from mm_gallery (originally 20120605111739)
class CreateMmGalleryArtifacts < ActiveRecord::Migration
  def change
    create_table :mm_gallery_artifacts do |t|
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
