# frozen_string_literal: true

# db/migrate/20241104081931_add_name_to_users.rb
class AddNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
  end
end
