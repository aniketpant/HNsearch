require "nestful"

module HNsearch
  class HNsearchAPI
    def initialize
      @client = "http://api.thriftdb.com/api.hnsearch.com/"
    end

    def query_users(query)
      api_response = Nestful.get @client + "users/_search", :q => query
      return api_response
    end

    def query_items(query)
      api_response = Nestful.get @client + "items/_search", :q => query
      return api_response
    end
  end
end