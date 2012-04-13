FactoryGirl.define do

  factory :team do
    name          { Forgery.dictionaries[:team_names].sample }
    nickname      { name.split(' ').last }
    abbreviation  { Forgery.dictionaries[:team_abbreviations].sample }
    location      { Forgery(:address).city }
    conference    { %w(AFC NFC).sample }
    division      { %w(North South East West).sample }
  end

  factory :user do
  	email                   { Forgery(:internet).email_address }
    password                { Forgery(:basic).password }
    password_confirmation   { password }
  end
end
