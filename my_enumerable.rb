module Enumerable
  def my_each_with_index
    for i in (0...self.length)
      yield(self[i], i)
    end
  end

  def my_each
    self.my_each_with_index do |item, index|
      yield(item)
    end
  end

  def my_select
    selected = []
    self.my_each do |item|
      selected << item if yield(item)
    end
    selected
  end

  def my_all?
    self.my_each do |item|
      return false unless yield(item)
    end
    true
  end

  def my_any?
    self.my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_none?
    self.my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_map(proc = nil)
    mapped = []
    self.my_each do |item|
      if proc.nil?
        mapped << yield(item)
      else
        mapped << proc.call(item)
      end
    end
    mapped
  end

  def my_inject
    if self.length == 0
      return
    end

    injected = self[0]
    for i in (1...self.length)
      injected = yield(injected, self[i])
    end
    injected
  end
end
