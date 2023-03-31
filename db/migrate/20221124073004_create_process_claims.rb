class CreateProcessClaims < ActiveRecord::Migration[7.0]
  def change
    create_table :process_claims do |t|
      t.references :cooperative#, null: false, foreign_key: true
      t.references :coop_branch#, null: false, foreign_key: true
      t.references :plan#, null: false, foreign_key: true
      t.references :agent#, null: false, foreign_key: true
      t.references :geo_region#, null: false, foreign_key: true
      t.references :geo_province#, null: false, foreign_key: true
      t.references :geo_municipality#, null: false, foreign_key: true
      t.references :geo_barangay#, null: false, foreign_key: true
      t.references :cause#, null: false, foreign_key: true
      t.references :claim_status
      t.string :unit
      t.string :insure_type
      t.string :street
      t.date :date_filed
      t.string :status
      t.string :lastname
      t.string :firstname
      t.string :middlename
      t.string :suffix
      t.date :birthdate
      t.string :gender
      t.integer :age
      t.string :occupation
      t.date :date_incident
      t.string :entry_type
      t.boolean :claim_filed
      t.boolean :processing
      t.boolean :approval
      t.boolean :payment
      t.boolean :release
      t.timestamps
    end
  end
end
