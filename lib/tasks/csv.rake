require "csv"

namespace :csv do
  desc "Import categories from csv"
  task import_categories: :environment do
    csv_file_path = "db/pf_csv_from_g_docs/pf_Categories_2016.csv"

    CSV.foreach(csv_file_path) do |row|
      Category.create!(name: row[0], user_id: 556) # Just me
      puts "One more category! #{row[0]}"
    end
  end

  desc "Import spendings from csv"
  task v_import_spendings: :environment do
    csv_file_path = "db/pf_csv_from_g_docs/pf_Valik_Spendings_2016.csv"

    u = User.find(556)
    CSV.foreach(csv_file_path) do |row|
      Spending.create!(
        name: row[1],
        user: u,
        category: Category.find_by(name: row[2], user: u),
        created_at: row[0],
        amount: row[3],
      )
      puts "One more spending! #{row[1]}"
    end
  end
end
