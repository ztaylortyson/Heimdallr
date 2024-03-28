class AddRepToParticipants < ActiveRecord::Migration[7.1]
  def change
      add_column :participants, :rep, :string
  end
end
