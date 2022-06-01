class Kitten < ApplicationRecord
  # Ensure kitten's name starts with capital letter
  before_save { |kitten| kitten.name.capitalize! }

  def as_json(options = {})
    super(except: [:created_at, :updated_at])
  end
end
