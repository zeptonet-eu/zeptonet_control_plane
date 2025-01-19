class CreateMachines < ActiveRecord::Migration[8.0]
  def change
    create_table :machines do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :public_key, null: false
      t.string :ip_address, null: false
      t.datetime :last_seen_at

      t.timestamps
    end
  end
end
