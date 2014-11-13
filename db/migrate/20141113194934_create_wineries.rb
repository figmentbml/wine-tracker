class CreateWineries < ActiveRecord::Migration
  def change
    create_table :wineries do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.string :hours
      t.string :phone_number
      t.string :email
      t.integer :rating
      t.string :description
      t.timestamps
    end
  end
end
