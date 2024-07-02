require 'date'
class InitiateNcController < ApplicationController
  attr_accessor :obj
  def intake
  end

  def pnc
      @params = params
      puts " = = = = &"
      puts @params.inspect
      logger.info("You should show params: #{@params.inspect}")
  end

  def goto_retainer_folder
      Dir.chdir(Rails.root.join("FOLDER", "ATTY", "RETAINER"))
  end
 
  def populate
      @pdftk.fill_form "./#{params[:action]}.pdf", "#{@full_name}_#{params[:action]}.pdf",
    {
      :client => @full_name,
      :date => Date.today,
      :phone => params[:phone],
      :email => params[:email]
    }
  end
  def populate_docx
      @doc.bookmarks['client1'].insert_text_after(@full_name)
      @doc.bookmarks['client2'].insert_text_after(@full_name)
      @doc.bookmarks['user_fname'].insert_text_after(current_user.fname)
      @doc.bookmarks['user_name'].insert_text_before(current_user.full_name)
      @doc.bookmarks['user_email'].insert_text_before(current_user.email)
      @doc.bookmarks['user_phone'].insert_text_before(current_user.wphone)
      @doc.bookmarks['date'].insert_text_after(Date.today)
  end
  def download
      send_file "#{@full_name}_#{params[:action]}.pdf", :disposition => 'attachment'
  end
  def download_docx
      send_file "#{params[:fname]}.docx", :disposition => 'attachment'
  end
  def generate_pdftk
    @pdftk = PdfForms.new('/usr/local/bin/pdftk')
  end

  def retainer
      @full_name = "#{params[:fname]} #{params[:lname]}"
      goto_retainer_folder
      generate_pdftk
      populate 
      #download
  end

  def retainer_docx
      @obj = params
      @full_name = "#{params[:fname]} #{params[:lname]}"
      goto_retainer_folder
      @doc = Docx::Document.open('retainer.docx')
      populate
      @doc.save("#{params[:fname]}-retainer.docx")
      download
  end

  def goto_atty_folder(foo)
      Dir.chdir(Rails.root.join("FOLDER", "ATTY", "#{foo}"))
  end

  def auth
      @full_name = "#{params[:fname]} #{params[:lname]}"
      foo = params[:action]
      goto_atty_folder(foo)
      @doc = Docx::Document.open('auth.docx')
      populate_docx 
      @doc.save("#{@full_name}-#{foo}.docx")
  end

end

