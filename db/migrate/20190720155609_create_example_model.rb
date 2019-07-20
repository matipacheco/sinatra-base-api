class CreateExampleModel < ActiveRecord::Migration[5.2]
  def change
    create_table :example_models do |t|
      t.string  :name
      t.text    :description
      t.timestamps
    end
  end
end
