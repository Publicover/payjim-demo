module ApplicationHelper

  def admin_panel(route_path)
    if current_user.role == 'admin'
      route_path
    end
  end

  def company_address(company)
    full_address = ""
    full_address << "#{company.name}\n\n" if company.name
    full_address << "#{company.add_ln1}\n" if company.add_ln1
    full_address << "#{company.add_ln2}\n" if company.add_ln2
    full_address << "Suite #{company.suite}\n" if company.suite
    full_address << "#{company.city_state_zip}\n" if company.city_state_zip
    full_address
  end

  def full_remit_address
    full_remit = ""
    full_remit <<  "#{ENV['REMIT_CO']}\n\n"
    full_remit <<  "#{ENV['REMIT_NAME']}\n"
    full_remit <<  "#{ENV['REMIT_ST_ADD']}\n"
    full_remit <<  "#{ENV['REMIT_CITY_ST']}"
    full_remit
  end

  def break_the_lines(text)
    text.to_s.gsub(/\n/, '<br/>').html_safe
  end
end
