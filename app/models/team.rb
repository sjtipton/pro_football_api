class Team < ActiveRecord::Base

  attr_accessible :name,
                  :nickname, 
                  :abbreviation, 
                  :location, 
                  :conference,
                  :division

  validates :name, :nickname, :abbreviation, :location, :conference, :division,
            presence: true
  validates :name, uniqueness: true
end
