# frozen_string_literal: true

RSpec::Matchers.define :have_item_with do |attributes|
  match do |array|
    array.any? do |item|
      attributes.all? do |attribute, value|
        item[attribute] == value
      end
    end
  end
end

RSpec::Matchers.define_negated_matcher :have_no_item_with, :have_item_with
