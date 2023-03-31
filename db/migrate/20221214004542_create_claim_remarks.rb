class CreateClaimRemarks < ActiveRecord::Migration[7.0]
  def change
    create_table :claim_remarks do |t|
      t.references :process_claim, null: false, foreign_key: true
      t.string :user
      t.string :status
      t.text :remark
      t.datetime :date_post
      t.timestamps
    end
  end
end
