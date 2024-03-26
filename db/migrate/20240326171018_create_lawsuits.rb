class CreateLawsuits < ActiveRecord::Migration[7.1]
  def change
    create_table :lawsuits do |t|
      t.string :cn
      t.string :ct
      t.string :forum
      t.string :location
      t.string :stage
      t.string :status
      t.string :judge
      t.string :old_judge
      t.string :dept
      t.string :lroa
      t.string :old_lroa
      t.string :atty_for
      t.references :user
      t.string :plt_caption
      t.string :def_caption

      t.timestamps
    end
  end
end
