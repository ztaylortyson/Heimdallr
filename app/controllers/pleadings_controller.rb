class PleadingsController < ApplicationController
  
  def goto_doc_folder
      Dir.chdir(Rails.root.join("FOLDER", "DOC"))
  end
  def goto_garbage_folder
      Dir.chdir(Rails.root.join("FOLDER", "GARBAGE"))
  end
  def set_lawsuit
      @lawsuit = Lawsuit.find(params[:format])
  end
  def populate_generic
      @doc.bookmarks['atty_for_top'].insert_text_after(@lawsuit.atty_for)
      @doc.bookmarks['atty_for_middle'].insert_text_after(@lawsuit.atty_for)
      @doc.bookmarks['atty_for_bottom'].insert_text_after(@lawsuit.atty_for)
      @doc.bookmarks['date_filed'].insert_text_after(@lawsuit.courtdates.first.complaint.strftime("%m/%d/%Y"))
      
      @doc.bookmarks['plt_caption'].insert_text_after(@lawsuit.plt_caption)
      @doc.bookmarks['def_caption'].insert_text_after(@lawsuit.def_caption)
      @doc.bookmarks['cn'].insert_text_after(@lawsuit.cn)
      @doc.bookmarks['judge'].insert_text_after(@lawsuit.judge)
      @doc.bookmarks['dept'].insert_text_after(@lawsuit.dept)
  end
  def download
    send_file "#{@lawsuit.atty_for}-generic.docx", :disposition => 'attachment'
  end
  def generic
    set_lawsuit
    goto_doc_folder
    @doc = Docx::Document.open('generic.docx')
    populate_generic
    @doc.save("#{@lawsuit.atty_for}-generic.docx")
    download 
  end

  def memo_panda
  end

  def notice_of_motion
  end

  def atty_decl
  end
end
