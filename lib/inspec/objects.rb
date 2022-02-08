# frozen_string_literal: true

module Inspec
  module Object
    require_relative "objects/tag"
    require_relative "objects/control"
    require_relative "objects/ruby_helper"
    require_relative "objects/describe"
    require_relative "objects/value"
    require_relative "objects/list"
    require_relative "objects/each_loop"
    require_relative "objects/or_test"
    require_relative "objects/test"
    require_relative "objects/input"
    require_relative "objects/header"
  end
end
