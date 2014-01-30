module MountableGallery
  class Artifact < ActiveRecord::Base
    permitted_attributes :file, :title, :caption, :sid, :icon, :tag

    act_as_matchcoded :sid

    scope :images, where(:type => "MountableGallery::ImageArtifact")
    scope :documents, where(:type => "MountableGallery::DocumentArtifact")
  end
end
