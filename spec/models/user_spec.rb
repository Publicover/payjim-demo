require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:f_name) }
  it { should validate_presence_of(:l_name) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
  it { should belong_to(:company) }
end
