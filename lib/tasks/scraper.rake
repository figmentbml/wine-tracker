srequire 'pp'
namespace :scraper do
  desc "collect wineries data"
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

  task :morewineries do
    data = ActiveSupport::JSON.decode(Rails.root.join("db/wineries.txt").read)
    num_of_files = (data.count / 42)
    winery_array = []
    data.each_slice(42) do |row|
      record = {}
      record[:areaid] = row[1]
      #record[:catering] = row[2]
      record[:city] = row[3]
      record[:copy1] = row[4]
      record[:copy2] = row[5]
      #record[:directions] = row[6]
      #record[:distributorid] = row[7]
      record[:email] = row[8]
      #record[:facilitydescription] = row[9]
      #record[:fax] = row[10]
      #record[:food] = row[11]
      #record[:gifts] = row[12]
      #record[:have_facility] = row[13]
      record[:hours] = row[14]
      #record[:isdist] = row[15]
      record[:lat] = row[16]
      record[:long] = row[17]
      record[:location] = row[18]
      record[:name] = row[19]
      #record[:orchard] = row[20]
      record[:otherinfo] = row[21]
      #record[:outlets] = row[22]
      #record[:parking] = row[23]
      #record[:parties] = row[24]
      record[:phone] = row[25]
      #record[:photo] = row[26]
      #record[:picnic] = row[27]
      #record[:related] = row[28]
      #record[:restaurant] = row[29]
      record[:state] = row[30]
      #record[:tables_chairs] = row[31]
      record[:tastingrm] = row[32]
      #record[:typeids] = row[33]
      record[:types] = row[34]
      #record[:vineyard] = row[35]
      record[:website] = row[36]
      record[:wineryid] = row[37]
      record[:wines] = row[38]
      #record[:wine_sales] = row[39]
      record[:wine_tasting] = row[40]
      record[:zip] = row[41]
      if (record[:types] == "Winery")
        winery_array << record
      end
    end
    File.open(Rails.root.join("test.rb"), "w") do |file|
      winery_array.to_s.gsub!()
      file.write(winery_array)
    end
  end

  task loadwineries: :environment do
    desc "collect wineries data"
    require "#{Rails.root.join("db/wineries_cleaned_up.rb")}"
    #Winery.delete_all
    @cowineries.each do |winery|
      record = {}
      record[:city] = winery[:city]
      record[:description] = "#{winery[:copy1] + winery[:copy2]}"
      record[:email] = winery[:email]
      record[:lat] = winery[:lat]
      record[:long] = winery[:long]
      record[:street] = winery[:location]
      record[:name] = winery[:name]
      record[:phone_number] = winery[:phone]
      record[:state] = winery[:state]
      record[:website] = winery[:website]
      record[:wine_list] = winery[:wines]
      record[:zip] = winery[:zip]
      record[:hours] = winery[:hours]
      record[:approved] = true
      w = Winery.new(record)
      w.save!
    end
  end

end
