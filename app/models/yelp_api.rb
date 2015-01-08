class YelpAPI

  def search(parameters)
    Yelp.client.search('CO', parameters)
  end

end
