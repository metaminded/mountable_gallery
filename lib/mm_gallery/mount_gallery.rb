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
      mm = membership_model.classify.constantize
      s = self.class.underscore
      self.send(membership_models).each(&:destroy)
      self.send "#{membership_models}=", toks.map.with_index do |id, i|
        mm.create!(
          position: i+1,
          s => self,
          artifact: Artifact.find(id)
        )
      end
    end
  end
end
