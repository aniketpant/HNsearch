require "HNsearch/version"
require "HNsearch/HNsearch_api"

module HNsearch
  def self.users(query)
    print HNsearchAPI.query_users(query)
  end

  def self.items(query)
    print HNsearchAPI.query_items(query)
  end
end
