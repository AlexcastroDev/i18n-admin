class CreateTranslations < ActiveRecord::Migration[7.1]
  def up
    create_table :languages do |t|
      t.string :key
      t.string :label
    end

    create_table :translations do |t|
      t.string :page
      t.string :i18n_key
      t.string :i18n_value

      t.references :i18n_key, foreign_key: { to_table: :languages, column: :key }
    end
  end

  def down
    drop_table :languages
    drop_table :translations
  end
end
