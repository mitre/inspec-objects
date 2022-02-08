# frozen_string_literal: true

require "inspec/input"

module Inspec::Object
  class Input < ::Inspec::Input
    # NOTE: No initialize method or accessors for the reasons listed above

    #--------------------------------------------------------------------------#
    #                               Marshalling
    #--------------------------------------------------------------------------#

    def to_hash
      as_hash = { name: name, options: {} }
      %i{description title identifier type required value}.each do |field|
        val = send(field)
        next if val.nil?

        as_hash[:options][field] = val
      end
      as_hash
    end

    def ruby_var_identifier
      identifier || "attr_" + name.downcase.strip.gsub(/\s+/, "-").gsub(/[^\w-]/, "")
    end

    def to_ruby
      res = ["#{ruby_var_identifier} = attribute('#{name}',{"]
      res.push "  title: '#{title}'," unless title.to_s.empty?
      res.push "  value: #{value.inspect}," unless value.to_s.empty?
      # to_ruby may generate code that is to be used by older versions of inspec.
      # Anything older than 3.4 will not recognize the value: option, so
      # send the default: option as well. See #3759
      res.push "  default: #{value.inspect}," unless value.to_s.empty?
      res.push "  description: '#{description}'," unless description.to_s.empty?
      res.push "})"
      res.join("\n")
    end
  end
end
