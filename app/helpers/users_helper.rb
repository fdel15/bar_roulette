module UsersHelper
  def retrieve_bar(location, number = 5)
    Yelp.client.search('San Francisco', { term: 'bar', radius_filter: number })
  end
end