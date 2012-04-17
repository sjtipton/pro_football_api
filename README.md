# Pro Football API

Examples:

```ruby
# Build home games for each team, essentially wiring in all matchups
def build_home_games(name, opponents, stadium)
  @team = Team.find_by_nickname(name)
  @home_games = []
  opponents.each do |nickname|
    opponent = Team.find_by_nickname(nickname)
    @home_games << Game.create(home_team_id: @team.id,
                               away_team_id: opponent.id,
                                      label: "#{opponent.nickname} at #{@team.nickname}",
                                     season: 2012,
                                    stadium: stadium)
  end
end


# Output an opponents list grouped by team (unordered, undated schedule)
@team_ids = (1..32).to_a
@team_ids.each do |id|
  @games = Game.where("away_team_id = ? or home_team_id = ?", id, id)
  @games.each do |g|
    ap g.label
  end
end
```
