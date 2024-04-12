# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, length: { minimum: 3, maximum: 30 }
end
