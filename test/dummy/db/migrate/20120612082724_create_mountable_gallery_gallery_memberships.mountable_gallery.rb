# This migration comes from mountable_gallery (originally 20120605112633)
class CreateMountableGalleryGalleryMemberships < ActiveRecord::Migration
  def change
    create_table :mountable_gallery_gallery_memberships do |t|
      t.references :gallery
      t.references :artifact
      t.integer :position

      t.timestamps
    end
    add_index :mountable_gallery_gallery_memberships, :gallery_id
    add_index :mountable_gallery_gallery_memberships, :artifact_id
  end
end
