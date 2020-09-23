class SearchController < ApplicationController

	def search
		@user_or_book = params[:option]
		@how_search = params[:choice]
		@search_value = params[:search]
		if @user_or_book == "1"
		   @users = User.search(@search_value, @how_search)
		else
		   @books = Book.search(@search_value, @how_search)
		end
	end
end
