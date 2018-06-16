class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :title
      t.string :company
      t.string :education
      # TODO: change
      t.string :gender

      t.datetime :created_at
      t.datetime :updated_at
      # t.int :gener # 1 = male, 2 = female
    end
  end
end
