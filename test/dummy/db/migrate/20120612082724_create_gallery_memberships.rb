# This migration comes from mountable_gallery (originally 20120605112633)
class CreateGalleryMemberships < ActiveRecord::Migration
  def change
    create_table :gallery_memberships do |t|
      t.references :gallery
      t.references :artifact
      t.integer :position

      t.timestamps
    end
    add_index :gallery_memberships, :gallery_id
    add_index :gallery_memberships, :artifact_id
  end
end
