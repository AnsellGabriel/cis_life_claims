class CreateClaimRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :claim_routes do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
