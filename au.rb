require 'selenium-webdriver'
require 'csv'
require 'fileutils'
require 'date'
require 'pry'
require 'pry-nav'

wait = Selenium::WebDriver::Wait.new(:timeout => 3) # seconds

# USER_AGENT = "Mac Safari' => 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_2; de-at) AppleWebKit/531.21.8 (KHTML, like Gecko) Version/4.0.4 Safari/531.21.10"
setting = Selenium::WebDriver::Chrome::Options.new
setting.add_argument('--user-agent=Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36')

# ブラウザの指定(Chrome)
driver = Selenium::WebDriver.for :chrome, options: setting




# 2秒待っても読み込まれない場合は、エラーが発生する
driver.manage.timeouts.implicit_wait = 0.3
# ページ遷移する

rows = []

driver.navigate.to "https://wowma.jp/"
# unless driver.find_element(:css, '.Sq9SEWjoMWXj').nil?
#   driver.find_element(:css, '.Sq9SEWjoMWXj').click
# end


File.open('import_data2.txt') do |file|
  file.each_line do |jan_code|

    p search_jan_code = jan_code.gsub(/\R| / ,"")

    sleep(3) 
    driver.find_element(:name, 'keyword').clear
    query = driver.find_element(:name, 'keyword')
    binding.pry
    query.send_keys(search_jan_code)
    query.submit

    # driver.execute_script('window.scroll(0,1000);')
    item_data = []

    wait.until do
      driver.find_elements(:css,'.productName')[0].displayed?

      item_names = driver.find_elements(:css, '.productName')
      item_names.each_with_index do |item_name, i|

        name = item_name.text

        break if i == 3

      rescue => e
        p e.message
      end
      p "--"
      p min_per_item_price = item_data.min

      rows << [jan_code, min_per_item_price]

    rescue => e
      p e.message
    end  
  rescue => e
    p e.message
  end
rescue => e
  p e.message
end
driver.quit

rows


header =  ["JAN", "最安値"]
day = DateTime.now.strftime('%Y%m%d_%H%M%S')

FileUtils.mkdir_p("output/yahoo") unless File.exists?("output/yahoo")

CSV.open("output/yahoo/#{day}.csv", "w", encoding: Encoding::SJIS, row_sep: "\r\n", force_quotes: true) do |csv|
  csv << header
  rows.each do |row|
    csv << row
  rescue => e
    p e.message
  end
rescue => e
  p e.message
end
