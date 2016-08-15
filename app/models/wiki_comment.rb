class WikiComment < ActiveRecord::Base
  scope :recent, -> { order('id DESC') }
  scope :older, -> { order('id ASC') }
  scope :active, -> { where(active_flag: true) }
  scope :inactive, -> { where("active_flag IS NULL OR active_flag = false") }


  def self.is_correct_word?(word)
    word.match(/Hello\!|香川県ルー|フジフーヅ|FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG/).nil?
  end

  # 半角文字の割合が多いとスパムと判定
  # per%より多い割合の全角文字があればok
  def self.is_not_spam?(word)
    jp_length = word.gsub(/[a-zA-Z0-9]/, "").to_s.split(//).size
    body_length = word.split(//).size
    per = 20.0
    if body_length * ( per / 100.0 )  < jp_length
      return true
    else 
      return false
    end
  end
end
