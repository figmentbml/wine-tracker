class AddColumnsToWines < ActiveRecord::Migration
  def change
    add_column :wines, :name, :string
    add_column :wines, :winery_id, :integer
  end
end
