class CreateSevens < ActiveRecord::Migration[6.0]
  def change
    create_table :sevens do |t|
      t.integer :principal
      t.integer :deposit
      t.integer :annual_yield_id
      t.integer :years_id
      t.timestamps
    end
  end
end