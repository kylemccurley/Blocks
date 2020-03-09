class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end
# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end
  
  def each
    index = 0

    while index < todos.size
      yield todos.fetch(index)
      index += 1
    end

    todos
  end
  
  def to_s
    todos.to_s
  end
  
  def first
    todos.first
  end
  
  def to_a
    todos
  end
  
  def item_at(position)
    todos.fetch(position)
  end
  
  def mark_undone_at(position)
    todos.fetch(position).undone!
  end
  
  def mark_done_at(position)
    todos.fetch(position).done!
  end
  
  def done!
    todos.map! { |item| item.done! }
  end
  
  def done?
    todos.all? { |item| item.done? == true }
  end
  
  def last
    todos.last
  end

  def add(item)
    unless item.class == Todo
      raise TypeError.new 'Only Todo objects can be added to the list'
    else
      todos << item
    end
  end
  
  def remove_at(pos)
    todos.delete(pos - 1)
  end
  
  def size
    todos.size
  end
  
  def pop
    todos.pop
  end
  
  def shift
    todos.shift
  end
  
  def select
    index = 0
    output = []
    self.each { |todo| output << todo if yield todo }
    output
  end
  
  private

  attr_accessor :todos
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }  

p results
