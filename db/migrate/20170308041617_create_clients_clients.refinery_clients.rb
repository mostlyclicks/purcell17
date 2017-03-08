# This migration comes from refinery_clients (originally 1)
class CreateClientsClients < ActiveRecord::Migration

  def up
    create_table :refinery_clients do |t|
      t.string :name
      t.string :company
      t.string :job_title
      t.string :city
      t.string :state
      t.text :body
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-clients"})
    end

    drop_table :refinery_clients

  end

end
