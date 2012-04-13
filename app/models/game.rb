class Game < ActiveRecord::Base

  attr_accessible :away_team_id,
                  :home_team_id,
                  :label,
                  :played_at,
                  :season,
                  :stadium,
                  :week

  validates :away_team_id, :home_team_id, :label, :season, :stadium, :week,
            presence: true
end
