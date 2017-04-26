class AddMoreDetailToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :max, :integer
    add_column :jobs, :min, :integer
    add_column :jobs, :email, :string
  end
end
