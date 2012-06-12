class ActiveRecord::Base
  def self.mount_gallery(membership_model)
    membership_models = membership_model.to_s.pluralize
    has_many membership_models, order: 'position asc'
    has_many :artifacts, through: membership_models

    self.send :define_method, "artifacts_tokens" do
      artifact_ids.join(",")
    end

    attr_accessible :artifacts_tokens
    self.send :define_method, "artifacts_tokens=" do |s|
      toks = s.split(",")
      mnn = membership_model.to_s.classify
      mm = self.class.const_defined?(mnn) ? mnn.constantize : "MountableGallery::#{mnn}".constantize
      s = self.class.to_s.underscore
      self.send(membership_models).each(&:destroy)
      self.send "#{membership_models}=", toks.map.with_index { |id, i|
        mm.create!(
          position: i+1,
          s => self,
          artifact: Artifact.find(id)
        )
      }
    end
  end
end
