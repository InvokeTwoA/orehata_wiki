class WikiComment < ActiveRecord::Base
  scope :recent, -> { order('id DESC') }
  scope :older, -> { order('id ASC') }
  scope :active, -> { where(active_flag: true) }
  scope :inactive, -> { where("active_flag IS NULL OR active_flag = false") }

  # kaminari
  # page_method_name :comment_page
end
