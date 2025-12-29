class ChangeGenreIdToNullableInBooks < ActiveRecord::Migration[7.0]
  def change
    # Изменяем колонку genre_id, чтобы она могла быть NULL
    change_column_null :books, :genre_id, true

    # Обновляем внешний ключ для каскадного обнуления
    remove_foreign_key :books, :genres
    add_foreign_key :books, :genres, on_delete: :nullify
  end
end