class ChangeCityToLocation < ActiveRecord::Migration
  def up
  	change_table(:teams) do |t|
  		t.rename :city, :location
  	end
  end

  def down
  	change_table(:teams) do |t|
  		t.rename :location, :city
  	end
  end
end
