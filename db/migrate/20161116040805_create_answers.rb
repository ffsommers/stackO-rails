class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :body
      t.boolean :best_flag
      t.integer :user_id
      t.integer :post_id
      t.references :commentable, polymorphic: true, index: true
      t.references :voteable, polymorphi: true, index: true

      t.timestamps
    end
  end
end
