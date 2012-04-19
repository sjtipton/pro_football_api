namespace :db do
  namespace :game do
    def build_home_games(name, opponents, stadium, season)
      @team = Team.find_by_nickname(name)
      @home_games = []
      opponents.each do |nickname|
        opponent = Team.find_by_nickname(nickname)
        @home_games << Game.create(home_team_id: @team.id,
                                   away_team_id: opponent.id,
                                          label: "#{opponent.nickname} at #{@team.nickname}",
                                         season: season,
                                        stadium: stadium)
        ap "Created '#{opponent.nickname} at #{@team.nickname}' matchup for the #{season} season"
      end
    end

    desc "Build home games for each team, essentially wiring in all matchups"
    task :build_all_matchups => :environment do

      json = File.open("#{Rails.root}/lib/tasks/home_team_opponents.json", 'rb') { |f| f.read }

      parsed = Yajl::Parser.parse(json, symbolize_keys: true)

      parsed.each do |p|
        build_home_games(p[:name], p[:opponents], p[:stadium], 2012)
      end
    end
  end
end
