require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'json'

page = Nokogiri::HTML(open("https://afisha.tut.by/film/"))   
puts page.class 


new_links = page.css('div#events-block a').select{|link| link['class']== "name"}
new_links.each{|name| puts name.xpath('.//span').text}