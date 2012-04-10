class Team < ActiveRecord::Base

  attr_accessible :name,
                  :nickname, 
                  :abbreviation, 
                  :city, 
                  :conference,
                  :division

  validates :name, :nickname, :abbreviation, :city, :conference, :division,
            presence: true
end
