class GetVkApi < ActiveRecord::Base
  def self.gets
    # require "net/http"
    # require "uri"
    # require 'rubygems'
    # require 'net/https'
    # require 'json'
    # require 'open-uri'
    # require 'pp'
# re=ENV["vk_token"]
    uri = URI.parse("https://api.vk.com/method/groups.getMembers")
    response = Net::HTTP.post_form(uri, {"group_id" => "bageto",
        "sort" => "id_desc",
        "offset" => "0",
        "count" => "10",
        "access_token" => ENV["vk_token"],
        "v" => "5.62"})
    e = JSON.parse(response.body)
    puts e["response"]["items"]
  end
end