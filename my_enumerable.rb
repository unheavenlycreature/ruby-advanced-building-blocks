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
      if yield(item)
        selected << item
      end
    end
    selected
  end

  def my_all?
    selected = []
    self.my_each do |item|
      if yield(item)
        selected << item
      end
    end
    selected.length == self.length
  end

  def my_any?
    selected = []
    self.my_each do |item|
      if yield(item)
        selected << item
      end
    end
    selected.length > 0
  end

  def my_none?
    selected = []
    self.my_each do |item|
      if yield(item)
        selected << item
      end
    end
    selected.length == 0
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
