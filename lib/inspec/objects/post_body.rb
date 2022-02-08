# frozen_string_literal: true

module Inspec::Object
  class PostBody
    attr_accessor :post_body

    def initialize(post_body)
      @post_body = post_body
    end

    def to_hash
      {
        post_body: post_body,
      }
    end

    def to_ruby
      post_body.inspect.to_s
    end

    def to_s
      "Post Body #{post_body}"
    end
  end
end
