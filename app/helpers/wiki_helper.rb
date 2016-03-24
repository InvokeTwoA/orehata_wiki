module WikiHelper
  include Redmine::Export::PDF::WikiPdfHelper

  def wiki_page_options_for_select(pages, selected = nil, parent = nil, level = 0)
    pages = pages.group_by(&:parent) unless pages.is_a?(Hash)
    s = ''.html_safe
    if pages.has_key?(parent)
      pages[parent].each do |page|
        attrs = "value='#{page.id}'"
        attrs << " selected='selected'" if selected == page
        indent = (level > 0) ? ('&nbsp;' * level * 2 + '&#187; ') : ''

        s << content_tag('option', (indent + h(page.pretty_title)).html_safe, :value => page.id.to_s, :selected => selected == page) +
               wiki_page_options_for_select(pages, selected, page, level + 1)
      end
    end
    s
  end

  def wiki_page_wiki_options_for_select(page)
    projects = Project.allowed_to(:rename_wiki_pages).joins(:wiki).preload(:wiki).to_a
    projects << page.project unless projects.include?(page.project)

    project_tree_options_for_select(projects, :selected => page.project) do |project|
      wiki_id = project.wiki.try(:id)
      {:value => wiki_id, :selected => wiki_id == page.wiki_id}
    end
  end

  def wiki_page_breadcrumb(page)
    breadcrumb(page.ancestors.reverse.collect {|parent|
      link_to(h(parent.pretty_title), {:controller => 'wiki', :action => 'show', :id => parent.title, :project_id => parent.project, :version => nil})
    })
  end

  # Returns the path for the Cancel link when editing a wiki page
  def wiki_page_edit_cancel_path(page)
    if page.new_record?
      if parent = page.parent
        project_wiki_page_path(parent.project, parent.title)
      else
        project_wiki_index_path(page.project)
      end
    else
      project_wiki_page_path(page.project, page.title)
    end
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
