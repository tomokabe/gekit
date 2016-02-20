require 'mechanize'

  agent = Mechanize.new
  page = agent.get("http://stage.corich.jp/index_now_stage.php")
  elements = page.search('.cellStage a')

  elements.each do |ele|
    puts ele.get_attribute('href')
  end