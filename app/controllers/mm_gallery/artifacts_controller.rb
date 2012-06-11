class MmGallery::ArtifactsController < MmGallery::ApplicationController

  def index()
    modelname, id = params[:object].split(";")
    model = modelname.constantize
    non_ids = id.present? ? model.find(id).artifact_ids : []
    artifacts = non_ids.present? ? MmGallery::Artifact.where('id not in (?)', non_ids) : MmGallery::Artifact.all
    respond_to  do |format|
      format.json do
        j = artifacts.map{|a| {id: a.id, title: a.title.presence || a.caption, image: a.icon_url(:icon56)} }.to_json
        logger.info j
        render json: j
      end
    end
    #raise "asa"
  end

end
