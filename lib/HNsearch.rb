require "HNsearch/version"
require "HNsearch/HNsearch_api"

module HNsearch
  def self.users(query)
    result = HNsearchAPI.new.query_users(query)
    print_users filter(result)
  end

  def self.items(query)
    result = HNsearchAPI.new.query_items(query)
    print_items filter(result)
  end

  def self.filter(result)
    return result.fetch("results")
  end

  def self.print_users(result)
    result.each {
      |e|
      e = e.fetch("item")
      username = e.fetch("username")
      karma = e.fetch("karma")

      out = []
      out.push "Username: " + e.fetch("username")
      out.push "Karma: " + e.fetch("karma").to_s
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
      out.push "Title: " + title
      out.push "URL: " + url
      out.push "Posted by: https://news.ycombinator.com/user?id=#{username} (#{username})"

      puts out.join("\n")
      puts("\n")
    }
  end
end