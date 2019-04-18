require 'rails_helper'

RSpec.describe Entry, type: :model do
  it { should belong_to(:task) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:time_worked) }
end
