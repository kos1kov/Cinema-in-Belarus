require 'rubygems'
require 'open-uri'
require 'nokogiri'

city = %w[МИНСК ГОМЕЛЬ ГРОДНО БРЕСТ ВИТЕБСК МОГИЛЕВ ЖЛОБИН МОЛОДЕЧНО]
list = ["https://afisha.tut.by/film/","https://afisha.tut.by/film-gomel/?ff",
"https://afisha.tut.by/film-grodno/?ff","https://afisha.tut.by/film-brest/?ff",
"https://afisha.tut.by/film-vitebsk/?ff","https://afisha.tut.by/film-mogilev/?ff",
"https://afisha.tut.by/film-zhlobin/","https://afisha.tut.by/film-molodechno/"]
puts 'Введите ваш город'
name = gets.chomp
city.include?(name.upcase) || puts("#{name} не найден")
if city.include?(name.upcase)
  link = list[city.index(name.upcase)]
else
  puts("#{name} не найден")
end
page = Nokogiri::HTML(open(link)) 
 new_links = page.css('div#events-block a').select{|link| link['class']== "name"}
 new_links.each{|name| puts name.xpath('.//span').text}
