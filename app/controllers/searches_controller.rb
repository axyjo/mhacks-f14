class SearchesController < ApplicationController
	def search
		@results = PgSearch.multisearch(params[:q] || '')
	end
end
