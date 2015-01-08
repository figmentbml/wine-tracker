namespace :yelp_data do
  desc "collect wineries data"
  task wineries: :environment do
    wineries = YelpAPI.new.search({ term: 'wineries' })
    wineries.businesses.each do |winery|
      record = {}
      record[:yelp_id] = winery.id
      record[:name] = winery.name
      record[:street] = winery.location.address[0]
      record[:city] = winery.location.city
      record[:zip] = winery.location.postal_code
      record[:state] = winery.location.state_code
      record[:phone_number] = winery.display_phone
      record[:winery_pic] = winery.image_url
      record[:yelp_url] = winery.url
      record[:yelp_review_count] = winery.review_count
      record[:yelp_rating] = winery.rating
      record[:yelp_rating_img_small] = winery.rating_img_url_small
      w = Winery.new(record)
      w.save!
    end
  end

end
