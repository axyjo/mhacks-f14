class ContentsController < ApplicationController
  before_action :set_publication
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :verify_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :verify_publication_author, only: [:edit, :create, :update, :destroy]

  # GET /publications/1/contents
  # GET /publications/1/contents.json
  def index
    @contents = Content.all
  end

  # GET /publications/1/contents/1
  # GET /publications/1/contents/1.json
  def show
  end

  # GET /publications/1/contents/new
  def new
    @content = Content.new
  end

  # GET /publications/1/contents/1/edit
  def edit
  end

  # POST /publications/1/contents
  # POST /publications/1/contents.json
  def create
    @content = Content.new(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1/contents/1
  # PATCH/PUT /publications/1/contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1/contents/1
  # DELETE /publications/1/contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_publication
      @publication = Publication.find(params[:publication_id])
    end

    def set_content
      @content = @publication.contents.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params[:content]
    end

    def verify_publication_author
      render status: :not_found and return if @content.publication.user != current_user
    end
end
