module MmGallery
  class Gallery < ActiveRecord::Base
    attr_accessible :description, :sid, :title
  end
end
