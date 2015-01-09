class AddAssocToWine < ActiveRecord::Migration
  def change
    remove_column :wines, :winery_id, :integer
    change_table :wines do |t|
      t.belongs_to :winery
      t.belongs_to :tasting_notes
      t.string :wine_pic
    end
  end
end
