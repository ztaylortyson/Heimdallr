require 'open-uri'
require 'nokogiri'

class ScrapersController < ApplicationController
  
  def sbn
      num = params[:query]

      if Oc.where(sbn:num).any?
        @indb = "Hello"
      else 
        @indb = "Goodbye"
      end


      @oc = Oc.new
     
      sbn_obj = SbnScraper.new(num)
      sbn_obj.info
      @data = sbn_obj.check
      
  end

 

  def bar
      # sbn = params[:bar]
    
      # @oc = Oc.where(sbn: sbn)
      # puts " & "
      # puts @oc.inspect

      # #url = "https://apps.calbar.ca.gov/attorney/Licensee/Detail/#{sbn}"
      # sbn = SbnScraper.new(sbn)
      # sbn.info 
      # sbn.check  
  end

  def roa
  end

  def pns
  end

  def ncf
  end

  def tr
  end
end
class SbnScraper
    attr_accessor :data
  def initialize(sbn)
      @page = Nokogiri::HTML(URI.open("https://apps.calbar.ca.gov/attorney/Licensee/Detail/#{sbn}"))
      @data = {}
  end 
  def info
      puts " 0 0 0 0 "
      #@blah = @page.xpath("//*[@id='moduleMemberDetail']/div[3]/p[1]/text()").to_s.strip
      @data[:full_name] = @page.xpath('//*[@id="moduleMemberDetail"]/div[2]/h3/b').text.split('#')[0].strip
      @data[:sbn] = @page.xpath('//*[@id="moduleMemberDetail"]/div[2]/h3/b').text.split('#').last .strip
      @data[:firmname] = @page.xpath("//*[@id='moduleMemberDetail']/div[3]/p[1]/text()").text.split(':')[1].split(',')[0].strip
      @data[:address] = @page.xpath("//*[@id='moduleMemberDetail']/div[3]/p[1]/text()").text.split(':')[1].strip
      @data[:phone] = @page.xpath("//*[@id='moduleMemberDetail']/div[3]/p[2]").text.split(':')[1].split('|').first.strip
      @data[:email] = @page.css("span#e#{email_filter}").text
      @data[:website] = @page.xpath("//*[@id='moduleMemberDetail']/div[3]/p[3]").text.split(':').last.strip
      @data[:status] = @page.xpath("//*[@id='moduleMemberDetail']/div[2]/div/p/b/span").text
  end
  def email_filter
      haystack = @page.css('style')[2].text
      needle = haystack.index('inline')
      start = needle - 11
      e = haystack[start..(start+2)]
      if e[0] == 'e'
        return e[1]
      else
        return e[0..1]
      end
  end
  def check
      @data
  end
end


