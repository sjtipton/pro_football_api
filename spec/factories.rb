FactoryGirl.define do

  factory :team do
    name          { Forgery.dictionaries[:team_names].sample }
    nickname      { name.split(' ').last }
    abbreviation  { Forgery.dictionaries[:team_abbreviations].sample }
    location      { "#{Forgery(:address).city}, #{Forgery(:address).state_abbrev}" }
    conference    { %w(AFC NFC).sample }
    division      { %w(North South East West).sample }
  end

  factory :user do
    email                   { Forgery(:internet).email_address }
    password                { Forgery(:basic).password }
    password_confirmation   { password }
  end

  factory :game do
    label         { "#{Forgery.dictionaries[:team_names].sample.split(' ').last} at #{Forgery.dictionaries[:team_names].sample.split(' ').last}" }
    season        { Forgery(:date).year }
    stadium       { "#{Forgery.dictionaries[:team_names].sample.split(' ').last} #{%w(Field Stadium Park Dome Coliseum).sample}" }
    week          { (1..17).to_a.sample }
    home_team_id  { SecureRandom.random_number(1e2.to_i) }
    away_team_id  { SecureRandom.random_number(1e2.to_i) }
    played_at     { Time.now }
  end
end
