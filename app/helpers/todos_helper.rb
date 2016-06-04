module TodosHelper

   def todo_title(todo)
    title = h(todo.title)

    if todo.public
      title + content_tag(:strong, " (public)")
    else
      title
    end
  end
end
