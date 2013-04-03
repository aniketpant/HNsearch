require "nestful"

module HNsearch
  class HNsearchAPI
    def self.initialize
      @client = "http://api.thriftdb.com/api.hnsearch.com/"
    end

    def self.query_users(query)
      api_response = Nestful.get "#{@client}users/_search?q=#{query}"
      return api_response
    end

    def self.query_items(query)
      api_response = Nestful.get "#{@client}items/_search?q=#{query}"
      return api_response
    end
  end
end