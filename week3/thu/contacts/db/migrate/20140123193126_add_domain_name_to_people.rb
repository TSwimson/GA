class AddDomainNameToPeople < ActiveRecord::Migration
  def change
    add_column :people, :domain_name, :string
  end
end
