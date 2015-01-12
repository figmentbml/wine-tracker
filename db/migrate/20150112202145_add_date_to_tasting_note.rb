class AddDateToTastingNote < ActiveRecord::Migration
  def change
    add_column :tasting_notes, :date, :date
  end
end
