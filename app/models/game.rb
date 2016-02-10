class Game < ActiveRecord::Base
  serialize :grid, Hash
  belongs_to :users
  validates :grid, uniqueness: true
end
