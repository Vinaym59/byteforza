class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :city
      t.boolean :is_email_verified,  default: false
      t.boolean :active,  default: false
      t.string :token_id
      t.string :password

      t.timestamps
    end
  end
end
