class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :nickname
      t.string :abbreviation
      t.string :city
      t.string :conference
      t.string :division

      t.timestamps
    end
  end
end
