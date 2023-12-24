class Language < ApplicationRecord
  validates :key, presence: true
  validates :label, presence: true
end
