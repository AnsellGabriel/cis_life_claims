class CreateBenefits < ActiveRecord::Migration[7.0]
  def change
    create_table :benefits do |t|
      t.string :name
      t.string :acronym
      t.text :description

      t.timestamps
    end
  end
end
