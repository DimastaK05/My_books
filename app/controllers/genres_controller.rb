class GenresController < ApplicationController
  before_action :require_login
  before_action :set_genre, only: [:destroy]

  def index
    @genres = current_user.genres.includes(:books).order(:name)
    @genre = Genre.new
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = current_user.genres.new(genre_params)

    if @genre.save
      redirect_to genres_path, notice: 'Жанр добавлен!'
    else
      @genres = current_user.genres.order(:name)
      render :index
    end
  end

  def destroy
    @genre = current_user.genres.find(params[:id])

    # Проверяем, используется ли жанр в книгах
    if @genre.books.any?
      redirect_to genres_path,
                  alert: 'Нельзя удалить жанр, так как он используется в книгах. Сначала удалите или измените книги этого жанра.'
    else
      @genre.destroy
      redirect_to genres_path, notice: 'Жанр удален!'
    end
  end

  private

  def set_genre
    @genre = current_user.genres.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end