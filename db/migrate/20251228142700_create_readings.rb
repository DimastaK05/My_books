class CreateReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :readings do |t|
      t.references :book, null: false, foreign_key: true
      t.date :read_date
      t.integer :rating
      t.text :note
      t.timestamps
    end
  end
end