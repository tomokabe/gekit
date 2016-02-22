require 'mechanize'

class Scraping

  def self.exec
    agent = Mechanize.new
    agent.read_timeout = 100 # 100sec timeout
    agent.ignore_bad_chunking = true
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

    image_url = page.at('.stageImg a img')[:src] if page.at('.stageImg a img')

    gekidan_tag = page.at('.divRight a')
    unless gekidan_tag
      puts "gekidanなし　url: #{url}です"
      return
    end
    gekidan = gekidan_tag.inner_text

    nichiji_tag = page.at('.stageInfo .f16.fBold')
    unless nichiji_tag
      puts "nichijiなし　url: #{url}です"
      return
    end
    nichiji = nichiji_tag.inner_text

    kouen = Kouen.where(title: title, gekidan: gekidan, image_url: image_url, nichiji:nichiji).first_or_initialize
    kouen.save
  end

end