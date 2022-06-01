class Kitten < ApplicationRecord
  # Ensure kitten's name starts with capital letter
  before_save { |kitten| kitten.name.capitalize! }
end
