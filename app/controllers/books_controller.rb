class BooksController < ApplicationController

   def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "Book was successfully created."
     redirect_to book_path(@book.id)
    else
      @books =Book.all
      render :index
    end
   end

  def index
    @books = Book.all
    @book  = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @newbook =Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path
    flash[:notice] = "Book was updated."
    else
    render:edit
    end
  end

  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy # データ（レコード）を削除
    redirect_to '/books'
    flash[:notice] = "Book was successfully destroyed."
  end


  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
