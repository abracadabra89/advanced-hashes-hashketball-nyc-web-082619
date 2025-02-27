# Write your code here!

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
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
         :slam_dunks => 7 
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
      }
    }, 
    :away => {
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
        "Bismak Biyombo" => {
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
        }
        }
      }
    }
  }
end

 def num_points_scored(name)
  game_hash().each do |location, team_data|
    team_data[:players].each do |player_name, player_stat|
      if name == player_name
        return player_stat[:points]
      end
    end
  end
end

 def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stat|
      if name == player_name
       return player_stat[:shoe]
      end
    end
  end
end


 def team_colors(team_name)
  game_hash.each do |location, team|
    if team[:team_name] == team_name
        return team[:colors]
    end
  end
end


 def team_names
  team_names = []
  game_hash.each do |location, team|
    team_names << team[:team_name]
  end
  team_names
end


 def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |location, team|
    if team[:team_name] == team_name
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            jersey_numbers << stats[:number]
          end
        end
      end
    end
  end
  jersey_numbers
end


 def player_stats(name)
  game_hash().each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if name == player_name
        return player_stats
      end
    end
  end 
end

 def big_shoe_rebounds()
  player_with_largest_shoe = find_player_with_longest_shoe()
  
  game_hash().each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if player_name == player_with_largest_shoe
        return player_stats[:rebounds]
      end
    end
  end
end

 def most_points_scored
  most_points = 0
  most_points_scored = "player"
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:points] > most_points
            most_points = stats[:points]
            most_points_scored = player
          end
        end
      end
    end
  end
  most_points_scored
end


 def winning_team
  home_team_points_total = 0
  away_team_points_total = 0
  game_hash.each do |location, team|
    if location == :home
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            home_team_points_total += stats[:points]
          end
        end
      end
    else
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            away_team_points_total += stats[:points]
          end
        end
      end
    end
  end
  if home_team_points_total > away_team_points_total
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

 def player_with_longest_name()
  longest_length = 0
  longest_player_name = nil
  
  game_hash().each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if player_name.length > longest_length
        longest_length = player_name.length
        longest_player_name = player_name
      end
    end
  end
  
  longest_player_name
end

 def long_name_steals_a_ton?
  best_steals = 0
  player_with_best_steals = "player"
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:steals] > best_steals
            best_steals = stats[:steals]
            player_with_best_steals = player
          end
        end
      end
    end
  end
  if player_with_best_steals == player_with_longest_name
    return true
  end
end 