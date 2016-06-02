#
#      t.text   :title
#      t.date   :release_date
#      t.text   :youtube_pv
#      t.text   :asin
#      t.string :hard_type
#
class Release < ActiveRecord::Base

  scope :recent, -> { order('release_date DESC') }
  scope :active, -> { where("release_date > NOW()") }

end
