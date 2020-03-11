require 'minitest/autorun'
require_relative 'todo_list'

class TodoListTest < MiniTest::Test
  def setup
    @list = TodoList.new('Test List')
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end
  
  def test_size
    assert_equal(3, @list.size)
  end
  
  def test_first
    assert_equal(@todo1, @list.first)
  end
  
  def test_last
    assert_equal(@todo3, @list.last)
  end
  
  def test_shift
    removed_todo = @list.shift
    assert_equal(@todo1, removed_todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_pop
    popped_todo = @list.pop
    assert_equal(@todo3, popped_todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_done?
    assert_equal(false, @list.done?)
  end
  
  def test_shovel
    new_todo = Todo.new('Take a shower')
    @list << new_todo
    assert_equal([@todo1, @todo2, @todo3, new_todo], @list.to_a)
  end
  
  def test_item_at
    assert_raises(IndexError) { @list.item_at(40) }
    assert_equal(@todo1, @list.item_at(0))
  end
  
  def test_add
    new_todo = Todo.new('Take a shower')
    @list.add(new_todo)
    assert_equal([@todo1, @todo2, @todo3, new_todo], @list.to_a)
  end
  
  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(20) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
  
  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @list.mark_all_done
    @list.mark_undone_at(0)

    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end
  
  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end
  
  def test_to_s
    
  end
end
