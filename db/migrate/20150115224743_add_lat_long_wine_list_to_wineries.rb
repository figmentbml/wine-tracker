class AddLatLongWineListToWineries < ActiveRecord::Migration
  def change
    add_column :wineries, :lat, :integer
    add_column :wineries, :long, :integer
    add_column :wineries, :wine_list, :string
  end
end
