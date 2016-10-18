# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach('seed_csvs/category.csv') do |csv_obj|
  Category.create(id: csv_obj[0].to_i, name: csv_obj[1], product_id: csv_obj[2].to_i)
 end

 CSV.foreach('seed_csvs/guests.csv') do |csv_obj|
   Category.create(id: csv_obj[0].to_i, name: csv_obj[1], email: csv_obj[2])
  end

  CSV.foreach('seed_csvs/merchant.csv') do |csv_obj|
    Category.create(id: csv_obj[0].to_i, name: csv_obj[1], email: csv_obj[2], password: csv_obj[3])
   end

   CSV.foreach('seed_csvs/orders.csv') do |csv_obj|
     Category.create(id: csv_obj[0].to_i, total_amount: csv_obj[1].to_i, guest_id: csv_obj[2].to_i, merchant_id: csv_obj[3].to_i, card_name: csv_obj[4], card_number: csv_obj[5].to_i, card_exp: csv_obj[6], card_cvv: csv_obj[7].to_i, billing_zip: csv_obj[8].to_i, shipping_street: csv_obj[8], shipping_city: csv_obj[9], shipping_state: csv_obj[10], shipping_zip: csv_obj[10].to_i  )
    end

    CSV.foreach('seed_csvs/product_categories.csv') do |csv_obj|
      Category.create(id: csv_obj[0].to_i, category_id: csv_obj[1].to_i, product_id: csv_obj[2])
     end

     CSV.foreach('seed_csvs/products_orders.csv') do |csv_obj|
       Category.create(id: csv_obj[0].to_i, product_id: csv_obj[1].to_i, order_id: csv_obj[2].to_i)
      end

      CSV.foreach('seed_csvs/products.csv') do |csv_obj|
        Category.create(id: csv_obj[0].to_i, name: csv_obj[1], description: csv_obj[2], price: csv_obj[3].to_i, image: csv_obj[4], merchant_id: csv_obj[2].to_i )
       end

       CSV.foreach('seed_csvs/reviews.csv') do |csv_obj|
         Category.create(id: csv_obj[0].to_i, product_id: csv_obj[1].to_i, description: csv_obj[2], author: csv_obj[3], stars: csv_obj[4].to_i)
        end
