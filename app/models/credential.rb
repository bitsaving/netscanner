# == Schema Information
#
# Table name: creds
#
#  id          :integer          not null, primary key
#  service_id  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user        :string(2048)
#  pass        :string(4096)
#  active      :boolean          default(TRUE)
#  proof       :string(4096)
#  ptype       :string(256)
#  source_id   :integer
#  source_type :string(255)
#

class Credential < MsfDatabase
  self.table_name = 'creds'

  has_many :hosts
end
