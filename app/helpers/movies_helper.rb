module MoviesHelper
  def sort_class(column)
    current_col = params[:sort].to_s
    current_dir = params[:direction].to_s == "desc" ? "desc" : "asc"
    return "" unless current_col == column.to_s
    current_dir == "asc" ? "sorted-asc" : "sorted-desc"
  end

  def sortable(column, label = nil)
    label ||= column.to_s.titleize
    current_col = params[:sort].to_s
    current_dir = params[:direction].to_s == "desc" ? "desc" : "asc"
    active = (current_col == column.to_s)
    next_dir = (active && current_dir == "asc") ? "desc" : "asc"
    link_to "#{ERB::Util.html_escape(label)} (#{next_dir})".html_safe,
            movies_path(sort: column, direction: next_dir),
            aria: { sort: active ? current_dir : "none" },
            class: "sortable-link #{'is-active' if active}"
  end
end
