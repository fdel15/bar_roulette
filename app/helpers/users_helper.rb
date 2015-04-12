module UsersHelper
  def retrieve_bar(coordinates, number = 5)
    Yelp.client.search_by_coordinates(coordinates, { term: 'bar', radius_filter: number })
  end
end