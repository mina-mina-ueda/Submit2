class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book =Book.find(params[:id])
  end

  def new
    @book = Book.new  
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: 'Book was Successfully created'
    else
      render :index
    end
  end
 
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])#←show
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'Book was Successfully created'
    else
      render :edit
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
