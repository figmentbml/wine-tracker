class AddImagesAndWebsitesToWineries < ActiveRecord::Migration
  def change
    add_column :wineries, :website, :string
    add_column :wineries, :winery_pic, :string
  end
end
