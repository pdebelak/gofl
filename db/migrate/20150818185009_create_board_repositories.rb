class CreateBoardRepositories < ActiveRecord::Migration
  def change
    create_table :board_repositories do |t|
      t.string :name
      t.string :slug
      t.text :board, default: []

      t.timestamps
    end
  end
end
