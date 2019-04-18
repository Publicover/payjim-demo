require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it { should belong_to(:company) }
  it { should have_many(:tasks) }
  it { should validate_presence_of(:billing_start) }
  it { should validate_presence_of(:contact) }
  it { should validate_presence_of(:project) }
end
