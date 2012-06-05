class CreateMmGalleryArtifacts < ActiveRecord::Migration
  def change
    create_table :mm_gallery_artifacts do |t|
      t.string :file
      t.string :type
      t.string :title
      t.text :caption
      t.timestamps
    end
  end
end
