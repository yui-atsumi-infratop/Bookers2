class BooksController < ApplicationController
before_action  :authenticate_user!

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
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
       render:edit
    else
        redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
     if @book.update(book_params)
        redirect_to book_path
        flash[:notice] = "Book was successfully updated."
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
