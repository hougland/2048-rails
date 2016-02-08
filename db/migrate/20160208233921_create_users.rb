class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :uid
      t.string :provider, :default => "github"
      t.integer :best_score, :default => 0

      t.timestamps null: false
    end
  end
end
