# create_table :games do |t|
#   t.string :title,       null: false
#   t.string :asin
#   t.date   :release_date
#   t.text   :pv_url
#   t.integer :total_score
#   t.timestamps
# end
class Game < ActiveRecord::Base
  scope :recent, -> { order('id DESC') }

  has_many :reviews

  # 平均点を算出
  def average_score
    reviews.count
  end

  def average_point(name)
    reviews.average(name).to_i
  end
end
