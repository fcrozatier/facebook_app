class CreateGenders < ActiveRecord::Migration[6.0]
  def change
    create_table :genders do |t|
      t.string :sex

      t.timestamps
    end
  end
end
