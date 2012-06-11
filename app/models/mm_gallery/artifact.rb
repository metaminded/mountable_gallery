module MmGallery
  class Artifact < ActiveRecord::Base
    attr_accessible :file, :title, :caption, :sid, :icon

    act_as_matchcoded :sid
  end
end
