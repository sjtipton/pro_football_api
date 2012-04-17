class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :label
      t.integer :season
      t.string :stadium
      t.integer :week
      t.integer :home_team_id
      t.integer :away_team_id
      t.datetime :played_at

      t.timestamps
    end
  end
end
