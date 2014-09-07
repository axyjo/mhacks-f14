class RewardsController < ApplicationController
  before_action :set_publication
  before_action :set_reward, only: [:show, :edit, :update, :destroy]

  # GET /publications/1/rewards
  # GET /publications/1/rewards.json
  def index
    @rewards = @publication.rewards.all
  end

  # GET /publications/1/rewards/1
  # GET /publications/1/rewards/1.json
  def show
  end

  # GET /publications/1/rewards/new
  def new
    @reward = @publication.rewards.new
  end

  # GET /publications/1/rewards/1/edit
  def edit
  end

  # POST /publications/1/rewards
  # POST /publications/1/rewards.json
  def create
    @reward = @publication.rewards.new(reward_params)

    respond_to do |format|
      if @reward.save
        format.html { redirect_to @publication, notice: 'Reward was successfully created.' }
        format.json { render :show, status: :created, location: @reward }
      else
        format.html { render :new }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1/rewards/1
  # PATCH/PUT /publications/1/rewards/1.json
  def update
    respond_to do |format|
      if @reward.update(reward_params)
        format.html { redirect_to @publication, notice: 'Reward was successfully updated.' }
        format.json { render :show, status: :ok, location: @reward }
      else
        format.html { render :edit }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1/rewards/1
  # DELETE /publications/1/rewards/1.json
  def destroy
    @reward.destroy
    respond_to do |format|
      format.html { redirect_to publication_rewards_url, notice: 'Reward was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_publication
      @publication = Publication.find( params[:publication_id])
    end

    def set_reward
      @reward = @publication.rewards.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_params
      params[:reward].permit(:title, :description, :limit, :price)
    end
end
