class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|

      t.string :body
      t.boolean :correct

      t.belongs_to :question

      t.timestamps
    end
  end
end
