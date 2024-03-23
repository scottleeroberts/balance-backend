class Game < ApplicationRecord
  validates_presence_of :name, :url, :category
  validates_format_of :url, with: URI::DEFAULT_PARSER.make_regexp

  enum category: {
    math: 0,
    reading: 1,
    speaking: 2,
    writing: 3
  }
end
