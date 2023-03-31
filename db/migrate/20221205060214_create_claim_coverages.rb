class CreateClaimCoverages < ActiveRecord::Migration[7.0]
  def change
    create_table :claim_coverages do |t|
      t.string :orno
      t.date :or_date
      t.string :bsno
      t.date :bs_date
      t.date :effectivity
      t.date :expiry
      t.decimal :amount, precision: 18, scale: 2
      t.decimal :amount_cover, precision: 18, scale: 2
      t.string :coverage_type
      t.string :status
      t.references :process_claim#, null: false, foreign_key: true
      t.timestamps
    end
  end
end
