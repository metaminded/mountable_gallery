class CreateMountableGalleryArtifacts < ActiveRecord::Migration
  def change
    create_table :mountable_gallery_artifacts do |t|
      t.string :title
      t.string :sid
      t.string :file
      t.string :icon
      t.string :type
      t.string :tag
      t.text :caption
      t.timestamps
    end
  end
end
