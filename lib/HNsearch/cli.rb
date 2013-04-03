require "HNsearch"
require "thor"

module HNsearch
  class CLI < Thor
    package_name "HNsearch"
    map "-u" => :users
    map "-i" => :items

    desc "users [QUERY]", "list all users"
    def users(query="")
      HNsearch::users(query)
    end

    desc "items [QUERY]", "list all items"
    def items(query="")
      HNsearch::items(query)
    end
  end
end