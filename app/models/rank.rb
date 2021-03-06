class Rank < ActiveRecord::Base
  belongs_to :user
  belongs_to :tournament
  has_many :game_ranks
  has_many :games, :through => :game_ranks

  validates_presence_of :user_id, :tournament_id

  def self.with_defaults
    where(:mu => 25.0, :sigma => 25.0 / 3.0)
  end

  def self.by_rank
    order('(ranks.mu - 3.0 * ranks.sigma) DESC')
  end

  def rank
    mu - 3.0 * sigma
  end
end
