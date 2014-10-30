class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :grape_varietal
      t.string :country
      t.string :state
      t.string :vineyard
      t.integer :year
      t.integer :rating
    end
  end
end
