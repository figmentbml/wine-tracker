class AddColumnsToWineries < ActiveRecord::Migration
  def change
    add_column :wineries, :yelp_id, :string
    add_column :wineries, :yelp_url, :string
    add_column :wineries, :yelp_review_count, :string
    add_column :wineries, :yelp_rating, :integer
    add_column :wineries, :yelp_rating_img_small, :string
  end
end
