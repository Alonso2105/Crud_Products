namespace :import do
  desc "Import products from CSV"
  task products: :environment do
    require 'csv'
    
    csv_file_path = Rails.root.join('db/data/product_list (1).csv')


    CSV.foreach(csv_file_path, headers: true) do |row|
      Product.create!(
        name: row['name'],
        price: row['price'],
        sku: row['sku'],
        is_seasonal: row['is_seasonal'].downcase == 'true',
        image: row['image'],
        quantity: row['quantity'],
        category: row['category']
      )
    end

    puts "Products imported"
  end
end
