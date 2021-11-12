class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book =Book.find(params[:id])
  end

  def new
    @book = Book.new  
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to book_path(book.id), notice: 'Book was Successfully created'
    else
      render :new
    end
  end
 
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])#←show
    if book.update(book_params)
      redirect_to book_path(book), notice; 'Book was Successfully updated'
    else
      render :new
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path
  end
  
  
  private
  def book_params
    params.require(:book).permit(:title, :body)#strong parameters
  end
end
