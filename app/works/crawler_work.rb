# coding: utf-8
require 'restclient'
require 'nokogiri'
require 'open-uri'
require 'logger'
require 'yaml'

class CrawlerWork
  MAX_RETRY_TIMES = 5

  def self.process(keyword) 
    logger = Logger.new('running.log')
    
    search_link = "http://mosaic.re.taobao.com/search?keyword=#{URI.escape(keyword)}&_input_charset=utf-8"
    logger.info "list page: #{search_link}"
    retry_times = 0
    
    begin
      doc = Nokogiri::HTML(open(search_link))
    rescue
      logger.error "download search page error: #{search_link}"
      retry_times += 1
      retry if retry_times < MAX_RETRY_TIMES
    end
    
    if doc.nil?
      logger.error "download search page error: #{search_link}"
      exit
    end
    
    count = 0
    doc.css('#searchResult .item').each_with_index do |div, i|
      #TODO count 自增不管用
      #count += 1
      begin
        #item_title = div.css('div.info a.title')[0]['title']
        item_shopname = div.css('div.info p.shopName span.shopNick')[0].content
        puts item_shopname
        if item_shopname == Setting.shops.my_shop 
          count = i+1
          break
        else
          count = 0
        end
      rescue
        logger.error "parse search page error: #{item_shopname} [#{count}]"
        next
      end
    
    end

    count
  end
end
