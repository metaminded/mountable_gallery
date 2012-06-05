module MmGallery
  class GalleryMembership < ActiveRecord::Base
    belongs_to :gallery
    belongs_to :artifact
    attr_accessible :position
  end
end
