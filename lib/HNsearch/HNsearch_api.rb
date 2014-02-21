require "nestful"
require "json"

module HNsearch
  class HNsearchAPI
    def initialize
      @client = "http://hn.algolia.com/api/v1/"
    end

    def query_users(query)
      api_response = Nestful.get "#{@client}users/#{query}"
      return JSON.parse(api_response.to_json)
    end

    def query_items(query)
      api_response = Nestful.get "#{@client}/search?query=#{query}&tags=story"
      return JSON.parse(api_response.to_json)
    end
  end
end