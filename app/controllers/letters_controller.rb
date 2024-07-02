class LettersController < ApplicationController
  
  def set_client
      @client = Client.find(params[:format])
  end
  def goto_corres_folder
      Dir.chdir(Rails.root.join("FOLDER", "CORRES"))
  end
  def download(foo)
    send_file "#{@client.fname}-#{foo}.docx", :disposition => 'attachment'
  end
  def populate
      @doc.bookmarks['clt_fname'].insert_text_after(@client.fname)
      @doc.bookmarks['clt_lname'].insert_text_after(@client.lname)
  end


  def pfr
      set_client
      #employer
      
  end
  def employer
      @client = Client.find(params[:client_id])
      @employer = params[:employer]

      goto_corres_folder
      @doc = Docx::Document.open('personnel_file_req.docx')
      populate
      @doc.save("#{@client.lname}-PersonnelFileReq.docx")
  end

  def letterhead

      # header footer unresolved.
      puts " = "
      puts params.inspect
      goto_corres_folder
      @doc = Docx::Document.open('letterhead.docx')

      @doc.bookmarks['attyname'].insert_text_after(current_user.full_name)
      puts "completed."
      @doc.save("#{current_user.sbn}-#{__method__}.docx")
  end

  def edd
  end

end
