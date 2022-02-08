# frozen_string_literal: true

module Inspec::Object
  class List < Value
    def map
      raise "Inspec::Object::List.map needs to be called with a block" unless block_given?

      t = List.new
      t.qualifier = [["x"]]
      yield(t)
      return if t.qualifier == [["x"]]

      @qualifier.push(["map", "{ |x| #{t.to_ruby} }"])
      self
    end
  end
end
