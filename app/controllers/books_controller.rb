class BooksController < ApplicationController
before_action :correct_user, only: [:edit, :update]

  def show

      @book = Book.find(params[:id])
      @user = current_user
      @user = @book.user
      @bookn = Book.new
  end

  def index
      @book = Book.new
      @books = Book.all
      @user = current_user
      @users = User.all
  end

  def edit

      @book = Book.find(params[:id])
      if @book.user != current_user
        redirect_to books_path

      end

  end

  def top
  end
  def create
      # ストロングパラメーターを使用
      book = Book.new(book_params)
      book.user_id = current_user.id
        # DBへ保存する
      if book.save
        # トップ画面へリダイレクト
      flash[:notice] = "successfully"
      redirect_to book_path(book)
      else
      @book = book
      @books = Book.all
      @user = current_user
      @users = User.all
      render :index
    end
  end
  def update
      book = Book.find(params[:id])
      book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(book.id)
  end

  def destroy
     book =Book.find(params[:id])
     book.destroy
     redirect_to books_path
  end

  private

  def book_params
        params.require(:book).permit(:title, :body, :image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(books_path) unless @user == current_user
  end
end

