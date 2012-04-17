# Pro Football API

## Getting Started

Install the dependencies outlined in the **Gemfile**

`bundle install`

Setup the database in one step from the schema and seed with 32 teams

`bundle exec rake db:setup`

Or, if you like to do things step-by-step...

```ruby
# Create the database
bundle exec rake db:create

# Run migrations on development and test
bundle exec rake db:migrate
bundle exec rake db:migrate RACK_ENV=test

# Seed the database with 32 teams
bundle exec rake db:seed
```

Create a User with an API token for accessing the API

```ruby
u = User.new(email: "youremail@example.com")
u.skip_confirmation!
u.save
```

Run the rake task that will build 256 matchups (an undated schedule).

`bundle exec rake db:game:build_all_matchups`

This will get the Game resource setup such that you can update each game with the `played_at` and `week` attribute values when the official schedule is released.  The data that is utilized in this task is a JSON-formatted array of hashes containing the home opponents for each team, as well as the home stadium name. This is designed so that each season when the next season's opponents for each team are released, the JSON opponents array can be updated for each team and rake task re-run.

## Example: Output an opponents list grouped by team (unordered, undated schedule)

The following code example will output a list of games grouped by team in an unordered state (assuming the schedule is yet to be released for the given season.

```ruby
@team_ids = (1..32).to_a
@team_ids.each do |id|
  @games = Game.where("away_team_id = ? or home_team_id = ?", id, id)
  @games.each do |g|
    ap "#{g.label}, #{g.stadium}"
  end
end
```
