class WelcomeController < ActionController::Base
  def index
  	@publications = Publication.all
    render "index"
  end
end