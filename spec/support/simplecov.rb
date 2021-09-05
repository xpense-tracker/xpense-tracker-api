# frozen_string_literal: true

unless ENV['CI']
  require 'simplecov'

  SimpleCov.start 'rails' do
    enable_coverage :branch
    primary_coverage :branch
  end
end
