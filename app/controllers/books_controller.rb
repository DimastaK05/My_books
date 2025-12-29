class BooksController < ApplicationController
  before_action :require_login

  def index
    if logged_in?
      @books = current_user.books.includes(:genre, :readings).order(created_at: :desc)
    end
  end

  def show
    @book = current_user.books.includes(:readings, :genre).find(params[:id])
  end

  def new
    @book = Book.new
    @genres = current_user.genres.order(:name)
  end

  def create
    @book = current_user.books.new(book_params)
    @genres = current_user.genres.order(:name)

    if @book.save
      redirect_to books_path, notice: 'Книга успешно добавлена!'
    else
      render :new
    end
  end

  def edit
    @book = current_user.books.find(params[:id])
    @genres = current_user.genres.order(:name)
  end

  def update
    @book = current_user.books.find(params[:id])
    @genres = current_user.genres.order(:name)

    if @book.update(book_params)
      redirect_to books_path, notice: 'Книга обновлена!'
    else
      render :edit
    end
  end

  def destroy
    @book = current_user.books.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Книга удалена!'
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre_id)
  end
end