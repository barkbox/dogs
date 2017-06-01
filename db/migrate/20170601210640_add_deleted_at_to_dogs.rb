class AddDeletedAtToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :deleted_at, :datetime
    add_index :dogs, :deleted_at
  end
end
