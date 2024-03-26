class CreateOcs < ActiveRecord::Migration[7.1]
  def change
    create_table :ocs do |t|
      t.string :full_name
      t.string :sbn
      t.string :fname
      t.string :address
      t.string :phone
      t.string :email
      t.string :website
      t.references :lawsuit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
