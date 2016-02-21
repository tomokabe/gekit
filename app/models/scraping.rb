require 'mechanize'

class Scraping

  def self.exec
    agent = Mechanize.new
    page = agent.get("http://stage.corich.jp/index_now_stage.php")
    urls = []
    elements = page.search('.cellStage a')

    elements.each do |ele|
     urls << ele.get_attribute('href')
    end

    urls.each do |url|
      scraping_from_detailpage(url)
    end
  end

  def self.scraping_from_detailpage(url)
    agent = Mechanize.new
    page = agent.get(url)
    title_tag = page.at('.divLeft h2 a')
    unless title_tag
      puts "titleなし　url: #{url}です"
      return
    end
    title = title_tag.inner_text

    gekidan_tag = page.at('.divRight a')
    unless gekidan_tag
      puts "gekidanなし　url: #{url}です"
      return
    end
    gekidan = gekidan_tag.inner_text

    writer_tag = page.at('.cellScript td')
    unless writer_tag
      puts "writerなし　url: #{url}です"
      return
    end
    writer = writer_tag.inner_text

    director_tag = page.at('.cellDirector td')
    unless director_tag
      puts "directorなし　url: #{url}です"
      return
    end
    director = director_tag.inner_text


    Kouen.create(title: title, gekidan:gekidan, writer:writer, director: director)
  end

end