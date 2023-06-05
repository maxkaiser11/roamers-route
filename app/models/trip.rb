class Trip < ApplicationRecord
  belongs_to :user
  validates :destination, :budget, :group_size, :interests, :starts_on, :ends_on, presence: true
end
