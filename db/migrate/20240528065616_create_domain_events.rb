class CreateDomainEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :domain_events do |t|
      t.string :type
      t.jsonb :data
      t.string :aggregate_type
      t.integer :aggregate_id

      t.timestamps
    end
  end
end
