class DevController < ApplicationController
  def home
  end

  def pns
  end

  def pns_search
  end

  def roa
  end

  def roa_search
      logger.info "at roa_search page"
      cn = params[:roa_search]
      @cyear = cn.split('-')[0]
      @cnum = cn.split('-')[1]
      logger.info "starting scraper"
      obj = ROA_Scraper.new(@cyear, @cnun)
      obj.launch
  end

end


class ROA_Scraper
    def initialize(cyear, cnum)
      @cyear = cyear
      @cnum = cnum
    end
    def start_browser
      @driver = Selenium::WebDriver.for :chrome
    end
    def goto_first_page
      @driver.get('https://www.sdcourt.ca.gov/sdcourt/generalinformation/accesscourtrecords')
    end
    def tear_down
      puts "Good Bye!"
      @driver.quit
    end
    def launch
        start_browser
        goto_first_page
        while @driver.current_url != "https://roa.sdcourt.ca.gov/roa/faces/CaptchaDisplay.xhtml"
          sleep(1)
        end
        tear_down
    end
end








