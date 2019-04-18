require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should belong_to(:invoice) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:rate) }
end
