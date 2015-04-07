class CreateJoinTableCredentialJob < ActiveRecord::Migration
  def change
    create_join_table :credentials, :jobs do |t|
      t.index [:credential_id, :job_id]
      t.index [:job_id, :credential_id]
    end
  end
end
