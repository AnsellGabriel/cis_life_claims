class CreateClaimBeneficiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :claim_beneficiaries do |t|
      t.references :process_claim#, null: false, foreign_key: true
      t.string :name
      t.date :birthdate
      t.string :relationship
      t.integer :age
      t.timestamps
    end
  end
end
