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
require 'aasm'

class Job < ActiveRecord::Base
  include AASM

  has_many :check_logs

  has_and_belongs_to_many :credentials, join_table: 'credentials_jobs'
  has_and_belongs_to_many :hosts

  scope :ready_to_start, -> { where(status: :new) }

  before_validation :set_defaults

  validates :name, presence: true
  validates :status, presence: true
  validates :host_ids, presence: true
  validates :credential_ids, presence: true

  aasm column: :status do
    state :new, initial: true
    state :in_progress
    state :sussessed
    state :error

    event :start do
      transitions from: :new, to: :in_progress
    end

    event :success do
      transitions from: [:new, :in_progress], to: :sussessed
    end

    event :error do
      transitions from: [:new, :in_progress], to: :error
    end
  end

  def self.search_by_name(query)
    query = "%#{query}%"
    name_match = arel_table[:name].matches(query)
    where(name_match)
  end

  private

  def set_defaults
    self.status ||= "new"
  end
end
