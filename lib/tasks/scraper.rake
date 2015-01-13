namespace :scraper do

  task :coloradowine do
    # require 'capybara'
    # Capybara.app_host = base_url
    # Capybara.driver = Capybara.javascript_driver
    # include Capybara::DSL
    # visit '/cms/index/fuseaction/page.ehwmap#;'
    # doc = Nokogiri::HTML(page.body)
    doc = Nokogiri::HTML(File.read('junk.html'))
    doc.css('#ehwmaplist > div').each do |element|
      p element.css("div > strong > a").first.text
      p element.css("div > small > a")[1]['href']
      puts "-" * 30
    end
  end

  task :wineries do
    page = Nokogiri::HTML(File.read('junk2.html'))
    page.css('#ehwdetail > span > div.mainpage > table:nth-child(1) > tbody > tr > td:nth-child(1) > table > tbody tr').each do |row|
      p row.css("td").text.remove("\n").remove("   ")
      puts "-" * 30
    end
  end

end
