class BooksController < ApplicationController
	
	before_action :authenticate_user!, :except => [:index]

	def index
		@books = Book.paginate :page => params[:page], :per_page => 10
 	end

	def new
		@book=Book.new
	end

	def create
		@book=Book.new(book_params)
		if @book.save
			flash[:notice]="#{@book.title} saved."
			redirect_to @book
		else
			render :new
		end
	end

	def show
		@book= Book.find(params[:id])
		@comment = @book.comments.paginate :page => params[:page], :per_page => 5 
	end

	def edit
		@book=Book.find(params[:id])
	end

	def update
		@book=Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice]="#{@book.title} updated"
			redirect_to @book
		else
			render :edit
		end
	end

	def destroy
	    @book = Book.find(params[:id])
	    @book.destroy
	 
	    redirect_to '/books/new'
    end


	private
	def book_params
		params.require(:book).permit(:title, :thoughts, :image, :image_cache)
	end


end
