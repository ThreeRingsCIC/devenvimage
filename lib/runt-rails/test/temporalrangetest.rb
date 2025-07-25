
# !/usr/bin/env ruby
# frozen_string_literal: true

require "baseexpressiontest"

# Unit tests for TemporalRange class
# Author:: Matthew Lipper

class TemporalRangeTest < BaseExpressionTest
  def test_include
    rspec = TemporalRange.new(@stub1)
    assert !rspec.include?("Any Object"), "Expression should not include any given argument"
    @stub1.match = true
    assert rspec.include?("Any Object"), "Expression should include any given argument"
  end

  def test_overlap
    range = DateRange.new(@date_20050101, @date_20050109)
    rspec = TemporalRange.new(range)
    assert !rspec.include?(@date_20050116), "Expression #{rspec} should not include #{@date_20050116}"
    assert rspec.include?(@date_20050102), "Expression #{rspec} should include #{@date_20050102}"
  end
end
