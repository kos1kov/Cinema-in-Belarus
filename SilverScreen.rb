require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'date'

city = %w[МИНСК ГОМЕЛЬ ГРОДНО БРЕСТ ВИТЕБСК МОГИЛЕВ ЖЛОБИН МОЛОДЕЧНО]
list = ['https://afisha.tut.by/day/film/', 'https://afisha.tut.by/day-gomel/film/',
'https://afisha.tut.by/day-grodno/film/', 'https://afisha.tut.by/day-brest/film/',
'https://afisha.tut.by/day-vitebsk/film/', 'https://afisha.tut.by/day-mogilev/film/',
'https://afisha.tut.by/day-zhlobin/film/', 'https://afisha.tut.by/day-molodechno/film/']
puts 'Введите ваш город'
name = gets.chomp
city.include?(name.upcase) || puts("#{name} не найден")
if city.include?(name.upcase)
  link = list[city.index(name.upcase)]
else
  puts("#{name} не найден")
end
puts 'введите дату(сегодня/завтра/12.12.2018)'
date = gets.chomp
case date.upcase
when 'СЕГОДНЯ'
  date = DateTime.now
when 'ЗАВТРА'
  date = DateTime.now
  date += 1
else
  date = Date.parse(date)
end

month = date.mon.to_s
date.mon < 10 && month = '0' + month

day = date.mday.to_s
date.mday < 10 && day = '0' + day

link = link + date.year.to_s + '/' + month + '/' + day + '/'
page = Nokogiri::HTML(open(link))
 new_links = page.css('div#events-block a').select{|link| link['class']== "name"}
if new_links.empty?
  puts 'к сожалению,данных на этот день нету'
else
  new_links.each{|name| puts name.xpath('.//span').text }
end
