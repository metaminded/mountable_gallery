class MmGallery::ArtifactsController < MmGallery::ApplicationController

  def index()
    artifacts = MmGallery::Artifact.all
    respond_to  do |format|
      format.json do
        j = artifacts.map{|a| {id: a.id, title: a.title.presence || a.caption, image: a.icon_url(:icon56)} }.to_json
        #logger.info j
        render json: j
      end
    end
    #raise "asa"
  end

end
