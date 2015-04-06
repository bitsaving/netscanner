class MsfDatabase < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "metasploit_#{Rails.env}".to_sym
end
