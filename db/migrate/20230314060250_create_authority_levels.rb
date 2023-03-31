class CreateAuthorityLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :authority_levels do |t|
      t.string :name
      t.decimal :min_authority, precision: 18, scale: 2
      t.decimal :max_authority, precision: 18, scale: 2
      t.string :description

      t.timestamps
    end
  end
end
