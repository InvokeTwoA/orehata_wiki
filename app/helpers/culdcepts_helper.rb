module CuldceptsHelper
  def forbidden_field_text(card)
    text = ""
    text += "水" if card.forbidden_water?
    text += "火" if card.forbidden_fire?
    text += "地" if card.forbidden_forrest?
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

  def cost_text(card)
    text = card.cost
    text = "#{text}+#{'▫︎'*card.card_cost}" if card.card_cost > 0
    text = "#{text}+#{card.element_cost}" if card.element_cost.present?
    text
  end

  def sort_activity_events_for_right_bar(events)
    events_by_group = events.group_by(&:event_group)
    sorted_events = []
    events.sort {|x, y| y.event_datetime <=> x.event_datetime}.each do |event|
      if group_events = events_by_group.delete(event.event_group)
        group_events.sort {|x, y| y.event_datetime <=> x.event_datetime}.each_with_index do |e, i|
          sorted_events << [e, i > 0]
        end
      end
    end
    sorted_events
  end
end
