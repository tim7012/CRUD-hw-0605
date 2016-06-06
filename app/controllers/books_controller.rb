class BooksController < ApplicationController

def index
  @books = Book.page(params[:page]).per(5)
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

    if @book.save
      redirect_to books_url
      flash[:notice] = "Book was successfully created"
    else
      render :action => :new
    end
  end
  #GET /events/edit/ :id
  def edit
    @book = Book.find(params[:id])
  end

  #POST /events/udpate/:id
  def update

    if @book = Book.find(params[:id])
      @book.update(books_params)
      redirect_to book_url(@book)
      flash[:notice] = "Book was successfully updated"
    else
      render :action => :edit
    end
  end

  #GET /events/destroy/:id
  def destroy
    flash[:alert] = "Book was successfully deleted"
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url :action => :index
  end

private
def books_params
    params.require(:book).permit(:name, :description)
end

end
