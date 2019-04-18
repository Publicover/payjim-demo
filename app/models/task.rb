class Task < ApplicationRecord
  belongs_to :invoice
  validates_presence_of :description, :rate, :hours
  before_save :set_total

  after_save do
    g_total = 0
    invoice.tasks.each do |task|
      g_total += task.total
    end
    invoice.update_attribute(:subtotal, g_total)

    set_invoice_total
  end

  after_destroy do
    g_total = 0
    invoice.tasks.each do |task|
      g_total += task.total
    end
    invoice.update_attribute(:subtotal, g_total)

    set_invoice_total
  end

  private

    def set_total
      subtotal = self.rate * self.hours
      self.assign_attributes(total: subtotal)
    end

    def set_invoice_total
      invoice_total = invoice.subtotal + invoice.adjustments
      invoice.update_attribute(:total, invoice_total)
    end
end
