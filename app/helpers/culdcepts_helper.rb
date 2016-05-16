module CuldceptsHelper
  def forbidden_field_text(card)
    text = ""
    text += "水" if card.forbidden_water?
    text += "火" if card.forbidden_fire?
    text += "土" if card.forbidden_forrest?
    text += "風" if card.forbidden_wind?
    text
  end

  def forbidden_item_text(card)
    text = ""
    text += " [[武器]] " if card.forbidden_weapon?
    text += " [[防具]] " if card.forbidden_armer?
    text += " [[道具]] " if card.forbidden_item?
    text += " [[巻物]] " if card.forbidden_spell?
    text
  end

  def br_encode(text)
    str = html_escape(text)
    str.gsub(/\r\n|\r|\n/, "<br />")
  end
end
