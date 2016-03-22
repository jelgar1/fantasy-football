class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :number_of_teams

      t.timestamps null: false
    end
  end
end
