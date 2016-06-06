module TodosHelper

  def todo_title(todo)
    title = h(todo.title)

    if todo.public
      title = title + content_tag(:span, "", class: "glyphicon glyphicon-bullhorn")  
    else
      title
    end

    if todo.done
    	title + content_tag(:span, " - done")
    end
  end

  # def todo_done(todo)
  # 	# content_tag(:i, "", class: "icon-trash icon-white") + "Delete", path_to_stuff, method: :delete, class: "btn btn-danger remove_fields" %>
  # 	if todo.done == true
  # 		content_tag(:div, content_tag(:a, "", :class: "disable" ))
  # 	end
  # end
end

