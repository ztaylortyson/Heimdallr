class CreateCourtdates < ActiveRecord::Migration[7.1]
  def change
    create_table :courtdates do |t|
      t.date :complaint
      t.string :old_complaint
      t.date :paga
      t.string :old_paga
      t.date :answer
      t.string :old_answer
      t.date :cmc
      t.string :old_cmc
      t.date :first_expert_exchange
      t.date :second_expert_exchange
      t.date :discovery_cutoff
      t.string :old_discovery_cutoff
      t.date :trc
      t.string :old_trc
      t.date :trial
      t.string :old_trial
      t.references :lawsuit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
