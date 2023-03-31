class CreateClaimConfinements < ActiveRecord::Migration[7.0]
  def change
    create_table :claim_confinements do |t|
      t.date :date_admit
      t.date :date_discharge
      t.decimal :amount, precision: 18, scale: 2
      t.references :process_claim
      t.timestamps
    end
  end
end
