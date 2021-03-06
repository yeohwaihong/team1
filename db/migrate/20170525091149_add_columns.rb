class AddColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :state, :string
    add_column :users, :vice, :string
    add_column :users, :role, :integer
  end
end
