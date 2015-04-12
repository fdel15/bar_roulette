module YelpApiHelper
  def retrieve_bar(coordinates)
    CLIENT.search_by_coordinates(coordinates, {category_filter: 'bars', radius_filter: 8047, limit: 10 }).businesses.shuffle.first
  end

  def bar_status
    @bar.is_closed ? "Closed" : "Open"
  end

  def bar_image
    @bar.image_url
  end

  def bar_address
    @bar.location.display_address
  end

  def bar_rating_image
    @bar.rating_img_url
  end

  def bar_description
    @bar.snippet_text
  end

  def bar_phone
    @bar.display_phone
  end

end

# result =  CLIENT.search_by_coordinates(coordinates, {category_filter: "bars", limit: 10, radius_filter: miles_to_meters(5) } ).businesses.shuffle.first.name

  # def retrieve_bar(coordinates, number = 50)
  #   CLIENT.search_by_coordinates(coordinates, { category_filter: 'bar', radius_filter: number }).businesses
  # end

  #  def search
  #   parameters = { term: params[:term], limit: 16 }
  #    CLIENT.search('San Francisco', parameters).businesses
  # end