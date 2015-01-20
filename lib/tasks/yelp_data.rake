namespace :yelp_data do
  desc "collect wineries yelp_ids"
  task wineries: :environment do
    wineries = YelpAPI.new.search({ term: 'wineries' })
    wineries.businesses.each do |winery|
      db_winery = Winery.where(name: winery.name)
      if db_winery
        puts "starting #{winery.name}"
        record = {}
        record[:yelp_id] = winery.id
        db_winery.update_all(record)
        puts "done with #{winery.name}"
      else
        record = {}
        record[:yelp_id] = winery.id
        w = Winery.new(record)
        w.save!
      end
    end
  end

end
