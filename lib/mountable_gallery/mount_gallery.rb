class ActiveRecord::Base
  def self.mount_gallery(membership_model)
    membership_models = membership_model.to_s.pluralize
    has_many membership_models, order: 'position asc', :dependent => :destroy
    has_many :artifacts, through: membership_models, class_name: 'MountableGallery::Artifact'

    self.send :define_method, "artifacts_tokens" do
      artifact_ids.join(",")
    end

    attr_accessible :artifacts_tokens
    self.send :define_method, "artifacts_tokens=" do |s|
      toks = s.split(",")
      mnn = membership_model.to_s.classify
      mm = mnn.constantize
      s = self.class.name.split("::").last.underscore
      self.send(membership_models).each(&:destroy)
      self.send "#{membership_models}=", toks.map.with_index { |id, i|
        mm.create!(
          position: i+1,
          s => self,
          artifact: MountableGallery::Artifact.find(id)
        )
      }
    end
  end
end
