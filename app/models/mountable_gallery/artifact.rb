module MountableGallery
  class Artifact < ActiveRecord::Base
    attr_accessible :file, :title, :caption, :sid, :icon

    act_as_matchcoded :sid

    scope :images, where(:type => "MountableGallery::ImageArtifact")
    scope :documents, where(:type => "MountableGallery::DocumentArtifact")
  end
end
