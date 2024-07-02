require 'fileutils'

class LawandmotionsController < ApplicationController
  
  def delete_doc
      File.delete("#{@lawsuit.atty_for}-#{foo}.docx")
  end

  def goto_lawandmotion_folder
      Dir.chdir(Rails.root.join("FOLDER", "LAWANDMOTION"))
  end
  def set_lawsuit
      @lawsuit = Lawsuit.find(params[:format])
  end
  def populate
      @doc.bookmarks['atty_for'].insert_text_after(@lawsuit.atty_for)
      @doc.bookmarks['cn'].insert_text_after(@lawsuit.cn)
      @doc.bookmarks['judge'].insert_text_after(@lawsuit.judge)
      @doc.bookmarks['dept'].insert_text_after(@lawsuit.dept)
      @doc.bookmarks['plt_caption'].insert_text_after(@lawsuit.plt_caption)
      @doc.bookmarks['def_caption'].insert_text_after(@lawsuit.def_caption)
      if @doc.bookmarks['date_filed']
        @doc.bookmarks['date_filed'].insert_text_after(@lawsuit.courtdate.complaint.strftime("%B %d,%Y"))
      end
      if @doc.bookmarks['trial_date']
          if @lawsuit.courtdate.trial.nil?
             @doc.bookmarks['trial_date'].insert_text_after("Not Set")
          else
            @doc.bookmarks['trial_date'].insert_text_after(@lawsuit.courtdate.trial.strftime("%B %d,%Y"))
          end
      end
     
  end
  def download(foo)
    send_file "#{@lawsuit.atty_for}-#{foo}.docx", :disposition => 'attachment'
  end

  def separate_statement
    foo = __method__
    goto_lawandmotion_folder
    set_lawsuit
    @doc = Docx::Document.open('separate_statement.docx')
    populate
    @doc.save("#{@lawsuit.atty_for}-separate_statement.docx")
    download(foo)
  end

  def proposed_order
    foo = __method__
    goto_lawandmotion_folder
    set_lawsuit
    @doc = Docx::Document.open('proposed_order.docx')
    populate
    @doc.save("#{@lawsuit.atty_for}-proposed_order.docx")
    download(foo)
  end

  def notice_of_motion
    foo = __method__
    goto_lawandmotion_folder
    set_lawsuit
    @doc = Docx::Document.open("#{foo}.docx")
    populate
    @doc.save("#{@lawsuit.atty_for}-#{foo}.docx")
    download(foo)
  end

  def memo_panda
    foo = __method__
    goto_lawandmotion_folder
    set_lawsuit
    @doc = Docx::Document.open("#{foo}.docx")
    populate
    @doc.save("#{@lawsuit.atty_for}-#{foo}.docx")
    download(foo)
  end

  def declaration
    foo = __method__
    goto_lawandmotion_folder
    set_lawsuit
    @doc = Docx::Document.open("#{foo}.docx")
    populate
    @doc.save("#{@lawsuit.atty_for}-#{foo}.docx")
    download(foo)
    puts " = = = = = "
    puts foo
    puts " = = = = = "
    puts "hello"

  end

end
