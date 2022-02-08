# frozen_string_literal: true

module Inspec::Object
  class Header
    attr_accessor :header

    def initialize(header)
      @header = header
    end

    def to_hash
      {
        header: header,
      }
    end

    def to_ruby
      header.inspect.to_s
    end

    def to_s
      "Header #{header}"
    end
  end
end
