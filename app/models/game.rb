class Game < ActiveRecord::Base
  serialize :grid, Hash
end
