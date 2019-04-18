class Invoice < ApplicationRecord
  belongs_to :company
  has_many :tasks, dependent: :destroy
  validates_presence_of :billing_start, :contact, :project
  before_save :set_due_date

  private

    def set_due_date
      if self.billing_end
        due_date = self.billing_end + 15.days
        self.assign_attributes(due: due_date)
      end
    end
end
