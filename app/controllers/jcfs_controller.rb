class JcfsController < ApplicationController
  def pes
    set_models
    generate_pdftk
    goto_jcf_folder
    populate
    download
  end
  def set_models
    @lawsuit = Lawsuit.find(params[:format])
    @attorney = current_user
  end
  def goto_jcf_folder
    Dir.chdir(Rails.root.join("FOLDER", "JCF"))
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
    puts Dir.pwd
    puts @lawsuit.atty_for
    @pdftk.fill_form "./#{params[:action]}.pdf", "#{@lawsuit.atty_for}_#{params[:action]}.pdf",
    {
      :atty_name => @attorney.full_name,
      :sbn => @attorney.sbn,

      :plaintiff   => @lawsuit.atty_for

      #:cmc_date  => @lawsuit.cmc.strftime("%m/%d/%Y"),
    
    }
  end







end
