# == Schema Information
#
# Table name: hosts
#
#  id            :integer          not null, primary key
#  ipaddress     :string
#  hostname      :string
#  macaddress    :string
#  responsetime  :string
#  ports         :string
#  logged        :string
#  langroup      :string
#  os            :string
#  tod           :string
#  users         :string
#  windowsname   :string
#  computermodel :string
#  status        :string
#  bruteprogress :string
#  credential_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Host < ActiveRecord::Base
  belongs_to :credential

  has_many :check_logs

  validates :status, presence: true

  state_machine :status, initial: :new do
    event :connect do
      transition new: :connected
    end

    event :loot do
      transition connected: :looted
    end

    event :error do
      transition new: :error
    end

    event :stop do
      transition new: :no_granted
    end
  end
end
