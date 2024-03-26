class CreateParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :role
      t.boolean :clt
      t.references :lawsuit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
