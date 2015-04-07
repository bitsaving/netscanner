class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :ipaddress
      t.string :hostname
      t.string :macaddress
      t.string :responsetime
      t.string :ports
      t.string :logged
      t.string :langroup
      t.string :os
      t.string :tod
      t.string :users
      t.string :windowsname
      t.string :computermodel
      t.string :status
      t.string :bruteprogress
      t.integer :credential_id

      t.timestamps null: false
    end
  end
end
