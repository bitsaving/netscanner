# == Schema Information
#
# Table name: jobs
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  description   :text
#  error_message :text
#  status        :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Job < ActiveRecord::Base
  has_many :check_logs

  has_and_belongs_to_many :credentials
  has_and_belongs_to_many :hosts

  scope :ready_to_start, -> { where(status: "new") }

  validates :name, presence: true
  validates :status, presence: true

  state_machine :status, initial: :new do
    event :start do
      transition new: :in_progress
    end

    event :success do
      transition [:new, :in_progress] => :sussessed
    end

    event :error do
      transition [:new, :in_progress] => :error
    end
  end
end
