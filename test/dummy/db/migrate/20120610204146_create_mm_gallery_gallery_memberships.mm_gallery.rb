# This migration comes from mm_gallery (originally 20120605112633)
class CreateMmGalleryGalleryMemberships < ActiveRecord::Migration
  def change
    create_table :mm_gallery_gallery_memberships do |t|
      t.references :gallery
      t.references :artifact
      t.integer :position

      t.timestamps
    end
    add_index :mm_gallery_gallery_memberships, :gallery_id
    add_index :mm_gallery_gallery_memberships, :artifact_id
  end
end
