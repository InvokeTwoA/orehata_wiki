class Gwent < ActiveRecord::Base
  scope :recent, -> { order('id DESC') }

  validates :name, presence: true

end
