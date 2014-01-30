class Gallery < ActiveRecord::Base
  permitted_attributes :description, :sid, :title
  mount_gallery :gallery_membership

  act_as_matchcoded :sid

end
