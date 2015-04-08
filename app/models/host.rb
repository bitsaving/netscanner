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
require 'aasm'

class Host < ActiveRecord::Base
  include AASM

  belongs_to :credential

  has_many :check_logs

  validates :status, presence: true

  aasm column: :status do
    state :new, initial: true
    state :connected
    state :looted
    state :error
    state :no_granted

    event :connect do
      transitions from: :new, to: :connected
    end

    event :loot do
      transitions from: :connected, to: :looted
    end

    event :error do
      transitions from: :new, to: :error
    end

    event :stop do
      transitions from: :new, to: :no_granted
    end
  end

  def self.search_by_ipaddress(query)
    query = "%#{query}%"
    ipaddress_match = arel_table[:ipaddress].matches(query)
    where(ipaddress_match)
  end
end
