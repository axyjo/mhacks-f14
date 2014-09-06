class CampaignsController < ApplicationController
  before_action :set_publication

  # GET /publications/1/campaign/new
  def new
    @campaign = @publication.campaign.new
  end

  # POST /publications/1/campaign
  # POST /publications/1/campaign.json
  def create
    @campaign = @publication.campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_publication
      @publication = Publication.find(params[:publication_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params[:campaign]
    end
end
