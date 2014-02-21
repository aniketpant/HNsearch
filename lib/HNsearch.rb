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
    print_user result
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
    print_items result
  end

  # This function fetches the results part of the JSON object

  # Example:
  #   >> HNsearch.filter(some_json_object)
  #   => Returns result key-value from the JSON object
  #
  # Arguments:
  #   result: (JSON object)

  def self.print_user(result)
    username = result.fetch("username")
    karma = result.fetch("karma")

    out = []
    out.push "Username: #{username}"
    out.push "Karma: #{karma}"
    out.push "Profile URL: https://news.ycombinator.com/user?id=#{username}"

    puts out.join("\n")
    puts("\n")
  end

  def self.print_items(result)
    result.fetch("hits").each {
      |e|
      title = e.fetch("title")
      url = e.fetch("url")
      author = e.fetch("author")
      points = e.fetch("points")

      out = []
      out.push "Title: #{title}"
      out.push "URL: #{url}"
      out.push "Posted by: https://news.ycombinator.com/user?id=#{author} (#{author})"
      out.push "Points: #{points}"

      puts out.join("\n")
      puts("\n")
    }
  end
end