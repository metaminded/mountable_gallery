module MmGallery
  class Artifact < ActiveRecord::Base
    attr_accessible :file, :title, :caption
  end
end
