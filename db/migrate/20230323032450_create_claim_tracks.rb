class CreateClaimTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :claim_tracks do |t|
      t.references :process_claim#, null: false, foreign_key: true
      t.references :user#, null: false, foreign_key: true
      t.references :claim_route#, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
