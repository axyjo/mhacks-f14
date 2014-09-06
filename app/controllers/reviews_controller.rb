class ReviewsController < ApplicationController
  before_action :set_publication
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :verify_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :verify_review_author, only: [:edit, :create, :update, :destroy]

  # GET /publications/1/reviews
  # GET /publications/1/reviews.json
  def index
    @reviews = @publication.reviews.all
  end

  # GET /publications/1/reviews/1
  # GET /publications/1/reviews/1.json
  def show
  end

  # GET /publications/1/reviews/new
  def new
    @review = @publication.reviews.new
  end

  # GET /publications/1/reviews/1/edit
  def edit
  end

  # POST /publications/1/reviews
  # POST /publications/1/reviews.json
  def create
    @review = @publication.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1/reviews/1
  # PATCH/PUT /publications/1/reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1/reviews/1
  # DELETE /publications/1/reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to publication_reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_publication
      @publication = Publication.find(params[:publication_id])
    end

    def set_review
      @review = @publication.reviews.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params[:review]
    end

    def verify_review_author
      render status: :not_found and return if @review.user != current_user
    end
end
