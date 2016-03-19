class WikiComment < ActiveRecord::Base
  scope :recent, -> { order('id DESC') }
  scope :active, -> { where(active_flag: true) }
  scope :inactive, -> { where("active_flag IS NULL OR active_flag = false") }
end
