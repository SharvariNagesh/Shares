class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :name
      t.decimal :current_price
      t.decimal :year_low
      t.decimal :year_high
      t.decimal :current_PE_ratio
      t.decimal :market_cap
      t.decimal :book_value
      t.text :description
      t.decimal :price_to_book_value

      t.timestamps null: false
    end
  end
end
