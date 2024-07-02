require 'selenium-webdriver'

class PagesController < ApplicationController
  def home
  end
  def pns
  end

  def pns_search
      scraper_obj = PNScraper.new
      search_name = params[:pns_search]
      @yo = scraper_obj.launch(search_name)
      #PNSTest.new
  end

  def roa_search
  end

end

  

  class PNSTest
    def initialize
      @driver = Selenium::WebDriver.for :safari
      @driver.get 'https://www.sdcourt.ca.gov/sdcourt/generalinformation/accesscourtrecords'
      puts " = = = = = = = = = = = "
      puts @driver.methods.sort
    end
  end


  class PNScraper
    def initialize
      @driver = Selenium::WebDriver.for :safari
      @driver.get 'https://www.sdcourt.ca.gov/sdcourt/generalinformation/accesscourtrecords'
      @driver.get 'https://courtindex.sdcourt.ca.gov/CISPublic/enter'
      #puts @driver.cookies
      sleep 3
      @driver.get 'https://courtindex.sdcourt.ca.gov/CISPublic/namesearch'
      sleep 2 
    end
    def launch(search_name)
      select_case_type
      select_location
      selection_party_type
      lname = @driver.find_element(:name, "lastname").send_keys "#{search_name}"
      btn = @driver.find_element(:xpath, "//input[@type='submit']").click
      sleep 2
      goto_PNS_folder
      sleep 1
      save_page_as_html
      sleep 1
      @driver.quit
    end
    def select_case_type
      case_type_opt = @driver.find_element(:name, "caseType")
      options = case_type_opt.find_elements(tag_name: 'option')
      options.each {|option| option.click if option.text == 'Civil'}
    end 
    def select_location
      c_loc = @driver.find_element(:name, "site")
      cl_options = c_loc.find_elements(tag_name: 'option')
      cl_options.each {|option| option.click if option.text == "Unknown-All"}
    sleep 1
    end
    def selection_party_type
      pt = @driver.find_element(:name, "partyType")
      pt_options = pt.find_elements(tag_name: 'option')
      pt_options.each {|option| option.click if option.text == "Unknown-All"}
    sleep 1
    end
    def goto_PNS_folder
        Dir.chdir(Rails.root.join('FOLDER', 'PNS'))
        puts "** Dir.pwd: #{Dir.pwd}"
    end
    def save_page_as_html
        doc = Nokogiri::HTML(@driver.page_source)
        open("party_name_search.html", 'w') do |i|
          i << doc
        end
    end
    
  end
