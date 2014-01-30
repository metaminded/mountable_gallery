class GalleryMembership < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :artifact, class_name: "MountableGallery::Artifact"
  permitted_attributes :position, :gallery, :artifact
end
