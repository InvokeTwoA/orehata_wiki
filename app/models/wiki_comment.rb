class WikiComment < ActiveRecord::Base
  scope :recent, -> { order('id DESC') }
  scope :older, -> { order('id ASC') }
  scope :active, -> { where(active_flag: true) }
  scope :inactive, -> { where("active_flag IS NULL OR active_flag = false") }


  def self.is_correct_word?(word)
    word.match(/Hello\!|香川県ルー|フジフーヅ|FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG/).nil?
  end

  # 半角だけのコメントだとスパムと判定
  # 全角が少しでも混じっていればtrueが返る
  def self.is_not_spam?(word)
    jp_length = word.gsub(/[a-zA-Z0-9]/, "").to_s.split(//).size
    body_length = body.split(//).size
    par = 90
    if body_length * ( par / 100 )  < jp_length
      return false
    else 
      return true
    end
  end
end
