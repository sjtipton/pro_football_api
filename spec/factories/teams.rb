FactoryGirl.define do

  factory :team do
    name          { Forgery.dictionaries[:team_names].sample }
    nickname      { name.split(' ').last }
    abbreviation  { Forgery.dictionaries[:team_abbreviations].sample }
    location      { Forgery(:address).city }
    conference    { %w(AFC NFC).sample }
    division      { %w(North South East West).sample }
  end
end
