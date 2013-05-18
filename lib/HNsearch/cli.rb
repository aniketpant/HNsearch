require "HNsearch"
require "thor"

module HNsearch
  class CLI < Thor
    package_name "HNsearch"
    map "-u" => :users
    map "-i" => :items

    desc "users [QUERY]", "returns information of queried user"
    def users(query="")
      HNsearch::users(query)
    end

    desc "items [QUERY]", "returns information of queried item"
    def items(query="")
      HNsearch::items(query)
    end
  end
end