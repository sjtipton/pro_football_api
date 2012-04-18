namespace :db do
  namespace :game do
    def add_dates_and_times(matches, week, played_at)
      matches.each do |match|
        game = Game.find_by_label(match)
        if game.week.blank? && game.played_at.blank?
          game.update_attributes(week: week, played_at: played_at)
          input_time = Time.parse(played_at) if played_at.class == String
          ap "Updated '#{match}' as Week #{week}, to be played on #{input_time.strftime("%a, %b.%e,%l:%M %P")}"
        else
          ap "Game already scheduled as Week #{game.week}, to be played on #{game.played_at.strftime("%a, %b.%e,%l:%M %P")}"
        end
      end
    end

    desc "Update all existing games with dates and times once official schedule is released"
    task :update_matchups_with_dates_and_times => :environment do

      json = File.open("#{Rails.root}/lib/tasks/schedule_dates_and_times.json", 'rb') { |f| f.read }

      parsed = Yajl::Parser.parse(json, symbolize_keys: true)

      parsed.each do |p|
        p[:matches].each do |m|
          add_dates_and_times(m[:labels], p[:week], m[:played_at])
        end
      end
    end
  end
end
