class BooksController < ApplicationController

def index
  @books = Book.all
end

def show
    @book = Book.find(params[:id])

    @page_title = @book.name
end

#GET /events/new
  def new
    @book = Book.new
  end

  #POST /events/create
  def create
    @book = Book.new(books_params)

    @book.save

    redirect_to books_url :action => :index #告訴遊覽器 HTTP code: 303
  end
  #GET /events/edit/ :id
  def edit
    @book = Book.find(params[:id])
  end

  #POST /events/udpate/:id
  def update
      @book = Book.find(params[:id])

      @book.update(books_params)

      redirect_to book_url(@book), :action => :show, :id => @book
  end

  #GET /events/destroy/:id
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url :action => :index
  end

private
def books_params
    params.require(:book).permit(:name, :description)
end

end
