#      t.integer :game_id,    null: false
#      t.integer :score,      null: false
#      t.string :created_by
#      t.string :title,       null: false
#      t.text :body_good,     null: false
#      t.text :body_bad,      null: false
#      t.text :body_free,     null: false
#      t.timestamps
class Review < ActiveRecord::Base
  scope :recent, -> { order('id DESC') }
  belongs_to :game

  validates :title, presence: true
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  after_create :increment_score

  def increment_score
    game.total_score += self.score
    game.save!
  end

end
