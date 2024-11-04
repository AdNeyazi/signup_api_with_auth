# frozen_string_literal: true

# db/migrate/20241104082342_add_jti_to_users.rb
class AddJtiToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :jti, :string, null: false
    add_index :users, :jti, unique: true
  end
end
