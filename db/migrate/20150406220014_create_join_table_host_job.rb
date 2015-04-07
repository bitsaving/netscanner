class CreateJoinTableHostJob < ActiveRecord::Migration
  def change
    create_join_table :hosts, :jobs do |t|
      t.index [:host_id, :job_id]
      t.index [:job_id, :host_id]
    end
  end
end
