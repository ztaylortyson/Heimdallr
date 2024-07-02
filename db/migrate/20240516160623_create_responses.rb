class CreateResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :responses do |t|
      t.string :group
      t.string :responding_party
      t.string :propounding_party
      t.string :discovery_type
      t.string :discovery_set
      t.references :lawsuit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
