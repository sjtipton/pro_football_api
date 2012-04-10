# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', location: cities.first)

## Create 32 NFL Teams
## :name, :nickname, :abbreviation, :location, :conference, :division
@teams = [{
    name: "Baltimore Ravens",
  nickname: "Ravens",
abbreviation: "BAL",
  location: "Baltimore, MD",
 conference: "AFC",
  division: "North"
 },{
    name: "Cincinnati Bengals",
  nickname: "Bengals",
abbreviation: "CIN",
  location: "Cincinnati, OH",
 conference: "AFC",
  division: "North"
 },{
    name: "Cleveland Browns",
  nickname: "Browns",
abbreviation: "CLE",
  location: "Cleveland, OH",
 conference: "AFC",
  division: "North"
 },{
    name: "Pittsburgh Steelers",
  nickname: "Steelers",
abbreviation: "PIT",
  location: "Pittsburgh, PA",
 conference: "AFC",
  division: "North"
 },{
    name: "Houston Texans",
  nickname: "Texans",
abbreviation: "HOU",
  location: "Houston, TX",
 conference: "AFC",
  division: "South"
 },{
    name: "Indianapolis Colts",
  nickname: "Colts",
abbreviation: "IND",
  location: "Indianapolis, IN",
 conference: "AFC",
  division: "South"
 },{
    name: "Jacksonville Jaguars",
  nickname: "Jaguars",
abbreviation: "JAX",
  location: "Jacksonville, FL",
 conference: "AFC",
  division: "South"
 },{
    name: "Tennessee Titans",
  nickname: "Titans",
abbreviation: "TEN",
  location: "Nashville, TN",
 conference: "AFC",
  division: "South"
 },{
    name: "Buffalo Bills",
  nickname: "Bills",
abbreviation: "BUF",
  location: "Orchard Park, NY",
 conference: "AFC",
  division: "East"
 },{
    name: "Miami Dolphins",
  nickname: "Dolphins",
abbreviation: "Miami",
  location: "Miami Gardens, FL",
 conference: "AFC",
  division: "East"
 },{
    name: "New England Patriots",
  nickname: "Patriots",
abbreviation: "NE",
  location: "Foxboro, MA",
 conference: "AFC",
  division: "East"
 },{
    name: "New York Jets",
  nickname: "Jets",
abbreviation: "NYJ",
  location: "East Rutherford, NJ",
 conference: "AFC",
  division: "East"
 },{
    name: "Denver Broncos",
  nickname: "Broncos",
abbreviation: "DEN",
  location: "Denver, CO",
 conference: "AFC",
  division: "West"
 },{
    name: "Kansas City",
  nickname: "Chiefs",
abbreviation: "KC",
  location: "Kansas City, MO",
 conference: "AFC",
  division: "West"
 },{
    name: "Oakland Raiders",
  nickname: "Raiders",
abbreviation: "OAK",
  location: "Oakland, CA",
 conference: "AFC",
  division: "West"
 },{
    name: "San Diego Chargers",
  nickname: "Chargers",
abbreviation: "SD",
  location: "San Diego, CA",
 conference: "AFC",
  division: "West"
 },{
    name: "Chicago Bears",
  nickname: "Bears",
abbreviation: "CHI",
  location: "Chicago, IL",
 conference: "NFC",
  division: "North"
 },{
    name: "Detroit Lions",
  nickname: "Lions",
abbreviation: "DET",
  location: "Detroit, MI",
 conference: "NFC",
  division: "North"
 },{
    name: "Green Bay Packers",
  nickname: "Packers",
abbreviation: "GB",
  location: "Green Bay, WI",
 conference: "NFC",
  division: "North"
 },{
    name: "Minnesota Vikings",
  nickname: "Vikings",
abbreviation: "MIN",
  location: "Minneapolis, MN",
 conference: "NFC",
  division: "North"
 },{
    name: "Atlanta Falcons",
  nickname: "Falcons",
abbreviation: "ATL",
  location: "Atlanta, GA",
 conference: "NFC",
  division: "South"
 },{
    name: "Carolina Panthers",
  nickname: "Panthers",
abbreviation: "CAR",
  location: "Charlotte, NC",
 conference: "NFC",
  division: "South"
 },{
    name: "New Orleans Saints",
  nickname: "Saints",
abbreviation: "NO",
  location: "New Orleans, LA",
 conference: "NFC",
  division: "South"
 },{
    name: "Tampa Bay Buccaneers",
  nickname: "Buccaneers",
abbreviation: "TB",
  location: "Tampa, FL",
 conference: "NFC",
  division: "South"
 },{
    name: "Dallas Cowboys",
  nickname: "Cowboys",
abbreviation: "DAL",
  location: "Arlington, TX",
 conference: "NFC",
  division: "East"
 },{
    name: "New York Giants",
  nickname: "Giants",
abbreviation: "NYG",
  location: "East Rutherford, NJ",
 conference: "NFC",
  division: "East"
 },{
    name: "Philadelphia Eagles",
  nickname: "Eagles",
abbreviation: "PHI",
  location: "Philadelphia, PA",
 conference: "NFC",
  division: "East"
 },{
    name: "Washington Redskins",
  nickname: "Redskins",
abbreviation: "WAS",
  location: "Landover, MD",
 conference: "NFC",
  division: "East"
 },{
    name: "Arizona Cardinals",
  nickname: "Cardinals",
abbreviation: "ARI",
  location: "Glendale, AZ",
 conference: "NFC",
  division: "West"
 },{
    name: "San Francisco 49ers",
  nickname: "49ers",
abbreviation: "SF",
  location: "San Francisco, CA",
 conference: "NFC",
  division: "West"
 },{
    name: "Seattle Seahawks",
  nickname: "Seahawks",
abbreviation: "SEA",
  location: "Seattle, WA",
 conference: "NFC",
  division: "West"
 },{
    name: "St. Louis Rams",
  nickname: "Rams",
abbreviation: "STL",
  location: "St. Louis, MO",
 conference: "NFC",
  division: "West"
 }]

Team.create(@teams)