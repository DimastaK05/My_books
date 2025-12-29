class ReadingsController < ApplicationController
  before_action :require_login
  before_action :set_book
  before_action :set_reading, only: [:edit, :update, :destroy]  # Обратите внимание: только edit, update, destroy

  def new
    @reading = @book.readings.build(read_date: Date.today)
  end

  def create
    @reading = @book.readings.build(reading_params)

    if @reading.save
      redirect_to @book, notice: 'Книга отмечена как прочитанная!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @reading.update(reading_params)
      redirect_to @book, notice: 'Отметка о прочтении обновлена!'
    else
      render :edit
    end
  end

  def destroy
    @reading.destroy
    redirect_to @book, notice: 'Отметка о прочтении удалена!'
  end

  private

  def set_book
    @book = current_user.books.find(params[:book_id])
  end

  def set_reading
    @reading = @book.readings.find(params[:id])
  end

  def reading_params
    params.require(:reading).permit(:read_date, :rating, :note)
  end
end