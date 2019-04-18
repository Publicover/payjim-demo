module InvoicesHelper
  def skinny_hours(amount)
    if amount % 1 == 0
      amount.to_i
    else
      amount
    end
  end

  def admin?
    if current_user.role == "#{ENV['BILLING_TYPE']}"
      true
    end
  end

  def show_billing_end(billing_end)
    if billing_end
      billing_end.to_formatted_s(:long)
    else
      'CURRENT'
    end
  end

  def show_due(due)
    if due
      'Due: ' + due.to_formatted_s(:long)
    else
      'OPEN'
    end
  end
end
