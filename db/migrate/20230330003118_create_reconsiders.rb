class CreateReconsiders < ActiveRecord::Migration[7.0]
  def change
    create_table :reconsiders do |t|
      t.references :process_claim, null: false, foreign_key: true
      t.references :claim_route, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.decimal :amount, precision: 18, scale: 2

      t.timestamps
    end
  end
end
