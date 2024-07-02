class CreateJournals < ActiveRecord::Migration[7.1]
  def change
    create_table :journals do |t|
      t.references :lawsuit, null: false, foreign_key: true
      t.text :entry
      t.string :binder
      t.string :issue
      t.decimal :costs, precision: 8, scale: 2

      t.timestamps
    end
  end
end
