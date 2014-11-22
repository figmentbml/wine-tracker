class CreateTastingNotes < ActiveRecord::Migration
  def change
    create_table :tasting_notes do |t|
      t.integer :wine_rating
      t.string :color_depth
      t.string :color_hue
      t.string :color_clarity
      t.string :aroma_intensity
      t.string :aroma_age
      t.string :aromas
      t.string :taste_dry
      t.string :taste_body
      t.string :taste_acid
      t.string :taste_tannin
      t.string :taste_balance
      t.string :taste_intensity
      t.string :flavors
      t.string :taste_finish
      t.string :notes
      t.belongs_to :wine
      t.belongs_to :user
      t.timestamps
    end
  end
end
