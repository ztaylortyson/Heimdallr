
class JcfsController < ApplicationController
  
  def launch
    set_models
    generate_pdftk
    goto_jcf_folder
    populate
    download
  end
  
  def electronic_documents
    set_models
    generate_pdftk
    goto_pos_folder
    populate
    download
  end
  def electronic_service
    set_models
    generate_pdftk
    goto_pos_folder
    populate
    download
  end
  def req_entry_of_default
    launch
  end
  def rfa
    launch
  end
  def amendment_to_complaint
    launch
  end
  def attachment
    launch
  end
  def decl
    launch
  end
  def peremptory_challenge
    launch
  end
  def pes
    launch
  end
  def ex_parte
    launch
  end
  def cms
    launch
  end
  def frog_e
    launch
  end
  def frog_g
    launch
  end
  def set_models
    @lawsuit = Lawsuit.find(params[:format])
    @attorney = current_user
  end
  def goto_jcf_folder
    Dir.chdir(Rails.root.join("FOLDER", "JCF"))
  end
  def goto_pos_folder
    Dir.chdir(Rails.root.join("FOLDER", "POS"))
  end

  def generate_pdftk
    @pdftk = PdfForms.new('/usr/local/bin/pdftk')
  end
  def download
        send_file "#{@lawsuit.atty_for}_#{params[:action]}.pdf", :disposition => 'attachment'
        puts "file downloaded!"
    end

  def populate
    puts " = = = = = = = = "
    puts @attorney.address.split(',')[1]
    puts Dir.pwd
    puts @lawsuit.atty_for
    @pdftk.fill_form "./#{params[:action]}.pdf", "#{@lawsuit.atty_for}_#{params[:action]}.pdf",
    {
      :atty_name => @attorney.full_name,
      :sbn => @attorney.sbn,
      :atty_firm => @attorney.fname,
      :atty_address => @attorney.address.split(',').first,
      :atty_city => @attorney.address.split(',')[1],
      :atty_state => @attorney.address.split(',')[2].split.first,
      :atty_zip => @attorney.address.split(',')[2].split.last,
      :atty_telephone => @attorney.wphone,
      :atty_email => @attorney.email,

      :atty_for => @lawsuit.atty_for.upcase,
      :plaintiff => @lawsuit.atty_for,
      # add defendant
      :judge_name => @lawsuit.judge,
      :judge_dept => @lawsuit.dept, 

      :ct_county => @lawsuit.ct_county,
      :ct_street_address => @lawsuit.ct_street_address,
      :ct_mail_address => @lawsuit.ct_mail_address,
      :ct_city_zip => @lawsuit.ct_city_zip,
      :ct_branch => @lawsuit.ct_branch,

      :case_number => @lawsuit.cn,
      :short_title => @lawsuit.ct,

      :defendant => @lawsuit.dname

      #:cmc_date  => @lawsuit.cmc.strftime("%m/%d/%Y"),
      # sales contract
      # ca arb 553
      # cdk program;
    }
  end


  def electronic_persons
    set_models
    generate_pdftk
    goto_pos_folder
    populate
    download
  end




end
