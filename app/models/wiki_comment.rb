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
    word =~ /[^ -~。-゜]/
  end


end
