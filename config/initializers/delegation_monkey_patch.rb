module ActiveRecord
  module Delegation
    alias_method :at, :[]
  end
end
