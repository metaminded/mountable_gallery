module MmGallery
  class Gallery < ActiveRecord::Base
    attr_accessible :description, :sid, :title
    has_many :gallery_memberships
    has_many :artifacts, through: :gallery_memberships

    act_as_matchcoded :sid

  end
end
