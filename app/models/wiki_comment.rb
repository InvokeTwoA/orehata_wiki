class WikiComment < ActiveRecord::Base
  scope :recent, -> { order('id DESC') }
  scope :older, -> { order('id ASC') }
  scope :active, -> { where(active_flag: true) }
  scope :inactive, -> { where("active_flag IS NULL OR active_flag = false") }


  def self.is_correct_word?(word)
    word.match(/Hello\!|香川県ルー|フジフーヅ|FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG/).nil?
  end

  # 半角文字の割合が多いとスパムと判定
  def self.is_not_spam?(word)
    Rails.logger.info word
    jp_length = word.gsub(/[a-zA-Z0-9]/, "").to_s.split(//).size.to_f
    Rails.logger.info "jp_length = #{jp_length}"
    body_length = word.split(//).size.to_f
    Rails.logger.info "body_length = #{body_length}"
    if ( jp_length / body_length ) > 0.5
      Rails.logger.info "true"
      return true
    else 
      Rails.logger.info "false"
      return false
    end
  end
end
