module MoviesHelper
  def sort_class(column)
    currently_selected_column = session[:col_to_sort]
    if(column.to_s == currently_selected_column.to_s)
      if(session[:direction].to_s == "asc")
        return "sorted-asc"
      end
      if(session[:direction].to_s == "desc")
        return "sorted-desc"
      end
    end
    return ""
  end

  def sortable(column, label = nil)
    label = column
    currently_selected_column = session[:col_to_sort]
    print("currently selected: ", currently_selected_column)
    print("column: ", column)
    current_dir = session[:direction]
    next_dir_string = ""
    if(column.to_s == currently_selected_column.to_s)
      print("got here")
      next_dir = "asc"
      if(current_dir.to_s == "asc")
        next_dir = "desc"
      end
      next_dir_string = "(#{next_dir})"
    end
    link_to "#{label} #{next_dir_string}".html_safe, movies_path(col_to_sort: column, direction: next_dir)

  end
end
