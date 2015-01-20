class UpdateWineryFields < ActiveRecord::Migration
  def change
    change_column :wineries, :description, :text
    change_column :wineries, :hours, :text
    change_column :wineries, :wine_list, :text
  end
end
