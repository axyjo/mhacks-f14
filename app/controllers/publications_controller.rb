class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show]
  before_action :set_user_publication, only: [:edit, :update, :destroy]
  before_action :verify_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :verify_publication_author, only: [:edit, :update, :destroy]

  # GET /publications
  # GET /publications.json
  def index
    @publications = Publication.all
  end

  def search
    @publications = Publication.basic_search(params[:q] || '')
    render 'index'
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
    @review = Review.new
    @publication
  end

  # GET /publications/new
  def new
    @publication = current_user.publications.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  # POST /publications.json
  def create
    @publication = current_user.publications.new(publication_params)

    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.preload(:rewards).find(params[:id])
    end

    def set_user_publication
      @publication = current_user.publications.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params[:publication].permit(:title, :description, :genre_id)
    end

    def verify_publication_author
      render status: :not_found and return if @publication.user != current_user
    end
end
