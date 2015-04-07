class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name, null: false
      t.text :description
      t.text :error_message
      t.string :status, null: false

      t.timestamps null: false
    end
  end
end
