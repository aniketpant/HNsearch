require "HNsearch/version"
require "HNsearch/HNsearch_api"

require "json"

module HNsearch
  def self.users(query)
    result = HNsearchAPI.new.query_users(query)
    print pretty_print(result)
  end

  def self.items(query)
    result = HNsearchAPI.new.query_items(query)
    print pretty_print(result)
  end

  def self.pretty_print(result)
    return JSON.pretty_generate result
  end
end
