class AddAssocToWineries < ActiveRecord::Migration
  def change
    change_table :wineries do |t|
      t.belongs_to :wine
    end
  end
end
