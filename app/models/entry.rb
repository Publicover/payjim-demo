class Entry < ApplicationRecord
  belongs_to :task
  validates_presence_of :description, :time_worked
end
