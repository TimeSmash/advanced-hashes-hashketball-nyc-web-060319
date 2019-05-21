# Write your code here!
require "pry"

def game_hash
  {
    home: { # team(home) = key, team_stat(bigass hash) = value 
      :team_name => "Brooklyn Nets", # #stat = key, value = value
      :colors => ["Black", "White"], #team colors array of strings
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }, 
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7,
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      } #ends players value hash
    }, #ends home value hash
    away: {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      } #end of players hash value
    } #end of away hash value
  } #end of overall hash
end 
  
def level_inquiry
  game_hash.each do |team, team_stat| #home/away bigass_hash
    binding.pry
      team_stat.each do |statue, value| 
        #tm_name,clrs,players nm_str,str_arr, playerstat_hash
        binding.pry
          if value.instance_of?(Hash) #allows entrance of playerstat hash 
            value.each do |data| #playerstat key playerstat value
              binding.pry
              # data.each do |ex1, ex2|
              #   binding.pry
              # end
            end
          end
        end
    end
  end

# level_inquiry

# def num_points_scored(player_name)
#   #If given a player name, want to return the points for that player
#   thing = game_hash.collect do |team, team_stat|
#     binding.pry
#     team_stat.collect do |statue, value| 
#       binding.pry
#       if value.instance_of?(Hash) #playerstat hash overall 
#         value.collect do |data| #access keys and values of playstat hash data[0] = name, data [1] =whole hash
#           binding.pry
#           if data[0] == player_name
#             data[1][:points]
#           end
#         end
#       end
#     end
#   end
#   thing.flatten.compact[0]
# end
         
def num_points_scored(player_name)
  find_the_player(player_name)[:points]
end
  

def players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def find_the_player(player_name)
  players.fetch(player_name)
end

def colors
  game_hash[:home][:colors].merge(game_hash[:home][:colors])
end 

def shoe_size(player_name)
  find_the_player(player_name)[:shoe]
end

def team_colors(team_name)
  game_hash.each do |locale, team_stat|
    if team_stat[:team_name] == team_name
      return team_stat[:colors]
    end
  end
end

def team_names
  game_hash.collect do |locale, team_stats|
    team_stats[:team_name]
  end
end

def player_numbers(team)
  # if team_names.include?(team)
    game_hash.each do |loc, quality_list|
      if quality_list[:team_name] == team
        quality_list.each do |team_qual, team_val| #p = nm,col,pl
          if team_qual == :players
            return team_val.collect do |player, player_quality|
              player_quality[:number]
            end
          end
        end
      end
    end
end

def player_stats(name)
  players.each do |player, stat_list|
    # player = name
    #stat_list = stat hash
    if name == player
      return stat_list
    end
  end
end

def player_shoe_sizes  
  players.collect do |player, qual|
    qual[:shoe]
  end
end

def big_shoe_rebounds
  biggest_shoe_size = player_shoe_sizes.sort[-1]
  # p biggest_shoe_size
  players.each do |a,b|
    # puts b[:shoe]
    if b[:shoe] == biggest_shoe_size
      return b[:rebounds]
    end
  end
end


  
  
  # if team_name == "Brooklyn Nets"
  #   home_nums = game_hash[:home][:players].collect do |name, qual_hash|
  #   qual_hash[:number]
  #   end
  # elsif team_name == "Charlotte Hornets"
  #   away_nums = game_hash[:away][:players].collect do |name, qual_hash|
  #     qual_hash[:number]
  #     end
  # end

