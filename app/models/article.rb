# frozen_string_literal: true

# Represents an article in the system.
#
# An article has a title, content, a URL, and an attached photo.
#
# The photo is managed using ActiveStorage.
class Article < ApplicationRecord
  has_one_attached :photo
end
