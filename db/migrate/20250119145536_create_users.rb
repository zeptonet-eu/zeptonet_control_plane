class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps

      t.index :email, unique: true
      t.index %i[provider uid], unique: true
    end
  end
end
