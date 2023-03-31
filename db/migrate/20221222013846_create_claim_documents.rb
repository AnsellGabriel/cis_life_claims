class CreateClaimDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :claim_documents do |t|
      t.references :process_claim, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
