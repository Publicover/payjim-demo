class Company < ApplicationRecord
  has_many :invoices, foreign_key: :company_id, dependent: :destroy
  has_many :users
  validates_presence_of :name
end
