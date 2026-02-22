require "csv"

namespace :products do
  desc "CSVから商品をインポート"
  task import: :environment do

    file_path = "db/csv/products.csv"

    unless File.exist?(file_path)
        puts "CSVファイルが見つかりません: #{file_path}"
        next
    end

    result = Products::ImportService.new(file_path).call

    puts "登録件数: #{result[:count]}"
    if result[:errors].any?
        puts "エラー:"
        result[:errors].each { |e| puts "  - #{e}" }
    end
  end
end
