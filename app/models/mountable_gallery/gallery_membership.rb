module MountableGallery
  class GalleryMembership < ActiveRecord::Base
    belongs_to :gallery
    belongs_to :artifact
    attr_accessible :position, :gallery, :artifact
  end
end
