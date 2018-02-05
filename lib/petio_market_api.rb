require "net/http"
require "net/https"
require "uri"
require 'cgi'

class PetioMarketAPI

  attr_accessor :market, :cookies
  URL = ENV["HOST"]

  def initialize(market, cookies)
    @market = market
    @cookies = cookies
    @url = URL
  end

  def fetch lang = nil
    params = {}
    params.merge!({lang: lang}) if lang.present?
    uri = full_path('/markets/' + @market + ".json", params)
    http = Net::HTTP.new(uri.host, uri.port)
    response = JSON.parse(http.get(uri,{"Cookie" => @cookies.collect{|k,v| ["#{k}=#{v}"]}.join(",")}).body)
  end

  def full_path(path, params)
    params_string = [path, params.to_query].join("?")
    URI.parse(@url + params_string)
  end
end