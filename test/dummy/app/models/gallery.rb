class Gallery < ActiveRecord::Base
  attr_accessible :description, :sid, :title
  mount_gallery :gallery_membership

  act_as_matchcoded :sid

end
