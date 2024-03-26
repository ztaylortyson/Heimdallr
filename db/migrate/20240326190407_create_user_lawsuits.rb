class CreateUserLawsuits < ActiveRecord::Migration[7.1]
  def change
    create_table :user_lawsuits do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lawsuit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
