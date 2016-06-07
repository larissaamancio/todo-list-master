module TodosHelper

  def todo_title(todo)
    title = h(todo.title)

    if todo.done
      title = title + content_tag(:span, " - done ")
    else
      title
    end

    if todo.public
      title = title + " " + content_tag(:span, " - public ")  
    else
      title
    end

    
  end

end

