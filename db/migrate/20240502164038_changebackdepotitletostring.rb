class Changebackdepotitletostring < ActiveRecord::Migration[7.1]
  def change
      change_column :depositions, :title, :string
  end
end
