# Write your code here!
require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

#takes in an argument of a player's name
#and returns the number of points scored for that player.
def num_points_scored player_name
  game_hash.each do |keys, vals|
    game_hash[keys][:players].each do |name_key, vals|
      if player_name == name_key
        return game_hash[keys][:players][name_key][:points]
      end
    end
  end
end

#takes in an argument of a player's name
#and returns the shoe size for that player.
def shoe_size player_name
  game_hash.each do |key, val|
    game_hash[key][:players].each do |name, val|
      if player_name == name
        return game_hash[key][:players][name][:shoe]
      end
    end
  end
end

#that takes in an argument of the team name
#and returns an array of that teams colors.
def team_colors team
  #color_arr = []
  game_hash.each do |key, val|
    #if game_hash[key][:team_name] == team_name
    return val[:colors] if val[:team_name] == team
  end
  #color_arr
end

#operates on the game hash to return an array of the team names.
def team_names
  team_name_arr = []
  game_hash.each do |loc, vals|
    team_name_arr << vals[:team_name]
  end
  team_name_arr
end

#takes in an argument of a team name
#and returns an array of the jersey number's for that team.
def player_numbers team
   jersey_number_arr = []
   game_hash.each do |key, vals|
    if vals[:team_name] == team
      vals[:players].each do |names, stats|
        stats.each do |keys, vals|
          if keys == :number
            jersey_number_arr << vals
          end
        end
      end
    end
  end
  jersey_number_arr
end

#takes in an argument of a player's name
#and returns a hash of that player's stats.
def player_stats player_name
 game_hash.each do |keys, vals|
   return vals[:players][player_name] if vals[:players].has_key?(player_name)
 end
end

#return the number of rebounds associated
#with the player that has the largest shoe size
def big_shoe_rebounds
  number_of_rebounds = 0
  largest_shoe_size = 0
  game_hash.each do |key, vals|
    #binding.pry
    vals[:players].each do |name_keys, stats|
      #binding.pry
      stats.each do |key, val|
        #binding.pry
        if key == :shoe && val > largest_shoe_size
          largest_shoe_size = val
          number_of_rebounds = stats[:rebounds]
        end
      end
    end
  end
  number_of_rebounds
end
