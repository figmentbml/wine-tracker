class AddApprovedToWineries < ActiveRecord::Migration
  def change
    add_column :wineries, :approved, :boolean, :default => false
  end
end
