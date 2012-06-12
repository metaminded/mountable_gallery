class GalleryMembership < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :artifact, class_name: "MountableGallery::Artifact"
  attr_accessible :position, :gallery, :artifact
end
