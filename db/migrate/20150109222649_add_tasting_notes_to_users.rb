class AddTastingNotesToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.belongs_to :tasting_notes
    end
  end
end
