require 'mechanize'

class Scraping

  def self.exec
    agent = Mechanize.new
    agent.read_timeout = 100 # 100sec timeout
    agent.ignore_bad_chunking = true
    page = agent.get("http://stage.corich.jp/index_now_stage.php")
    page.encoding = 'utf-8'
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

    cast_tag = page.at('.rightInfo .stageInfo .cellCast+td')
    unless cast_tag
      puts "castなし　url: #{url}です"
      return
    end
    cast = cast_tag.inner_text

    detail_tag = page.at('.rightInfo .stageInfo .cellExplain+td')
    unless detail_tag
      puts "detailなし　url: #{url}です"
      return
    end
    detail = detail_tag.inner_text

    writer_tag = page.at('.rightInfo .stageInfo .cellScript+td')
    unless writer_tag
      puts "writerなし　url: #{url}です"
      return
    end
    writer = writer_tag.inner_text

    director_tag = page.at('.rightInfo .stageInfo .cellDirector+td')
    unless director_tag
      puts "writerなし　url: #{url}です"
      return
    end
    director = director_tag.inner_text

    timetable_tag = page.at('.rightInfo .stageInfo .cellTable+td')
    unless timetable_tag
      puts "timetableなし　url: #{url}です"
      return
    end
    timetable = timetable_tag.inner_text

    basho_tag = page.at('.rightInfo .stageInfo .cellTheater+td a')
    unless basho_tag
      puts "bashoなし　url: #{url}です"
      return
    end
    basho = basho_tag.inner_text

    category_tag = page.at('.divCategory a')
    unless category_tag
      puts "categoryなし　url: #{url}です"
      return
    end
    category = category_tag.inner_text

    area_tag = page.at('.divLocation a+a')
    unless area_tag
      puts "areaなし　url: #{url}です"
      return
    end
    area = area_tag.inner_text

    kouen = Kouen.where(title: title, gekidan: gekidan, image_url: image_url, nichiji: nichiji, cast: cast, detail: detail, writer: writer, director: director, timetable: timetable, basho: basho, category: category, area:area).first_or_initialize
    kouen.save
  end

end