class AddTenantIdToLease < ActiveRecord::Migration[6.1]
  def change
    add_column :leases, :tenant_id, :integer
  end
end
