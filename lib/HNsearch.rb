require "HNsearch/version"
require "HNSearch/HNsearch_api"

module HNsearch
  def self.users(query)
    print HNSearchAPI.query_users(query)
  end

  def self.items(query)
    print HNSearchAPI.query_items(query)
  end
end
