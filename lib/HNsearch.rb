require "HNsearch/version"
require "HNsearch/HNsearch_api"

# The driver
module HNsearch
  # Use this to search for users

  # Example:
  #   >> HNsearch.users("aniketpant")
  #   => Returns JSON object of the result and then runs print_users
  #
  # Arguments:
  #   query: (String)

  def self.users(query)
    result = HNsearchAPI.new.query_users(query)
    print_users filter(result)
  end

  # Use this to search for items

  # Example:
  #   >> HNsearch.items("awesome")
  #   => Returns JSON object of the result and then runs print_items
  #
  # Arguments:
  #   query: (String)

  def self.items(query)
    result = HNsearchAPI.new.query_items(query)
    print_items filter(result)
  end

  # This function fetches the results part of the JSON object

  # Example:
  #   >> HNsearch.filter(some_json_object)
  #   => Returns result key-value from the JSON object
  #
  # Arguments:
  #   result: (JSON object)

  def self.filter(result)
    return result.fetch("results")
  end

  # This function fetches the results part of the JSON object

  # Example:
  #   >> HNsearch.filter(some_json_object)
  #   => Returns result key-value from the JSON object
  #
  # Arguments:
  #   result: (JSON object)

  def self.print_users(result)
    result.each {
      |e|
      e = e.fetch("item")
      username = e.fetch("username")
      karma = e.fetch("karma")

      out = []
      out.push "Username: #{username}"
      out.push "Karma: #{karma}"
      out.push "Profile URL: https://news.ycombinator.com/user?id=#{username}"

      puts out.join("\n")
      puts("\n")
    }
  end

  def self.print_items(result)
    result.each {
      |e|
      e = e.fetch("item")
      title = e.fetch("title")
      url = e.fetch("url")
      username = e.fetch("username")

      out = []
      out.push "Title: #{title}"
      out.push "URL: #{url}"
      out.push "Posted by: https://news.ycombinator.com/user?id=#{username} (#{username})"

      puts out.join("\n")
      puts("\n")
    }
  end
end