class CreateCompanyAreas < ActiveRecord::Migration
  def change
    create_table :company_areas do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
