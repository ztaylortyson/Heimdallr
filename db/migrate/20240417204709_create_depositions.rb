class CreateDepositions < ActiveRecord::Migration[7.1]
  def change
    create_table :depositions do |t|

      t.timestamps
    end
  end
end
