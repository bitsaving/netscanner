# == Schema Information
#
# Table name: check_logs
#
#  id            :integer          not null, primary key
#  workspace_id  :integer          default(1), not null
#  job_id        :integer          not null
#  message       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  resnetscan_id :integer          not null
#

class CheckLog < MsfDatabase
  belongs_to :job,
             inverse_of: :check_logs

  belongs_to :host,
             inverse_of: :check_logs
end
