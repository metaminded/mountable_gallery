
class MountableArtifactPickerInput < SimpleForm::Inputs::Base
  def input
    template.render partial: 'mountable_artifacts_picker',
      locals: {
        object: object,
        attribute_name: attribute_name,
        artifacts: object.send(attribute_name),
        form: @builder
      }
  end
end
