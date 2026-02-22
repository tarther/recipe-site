require "csv"

module Products
  class ImportService

    #CSVファイルを受け取る
    def initialize(file_path)
      @file_path = file_path
    end


    def call
      errors = []
      records = []
      
      #CSVを1行ずつ読み込む
      CSV.foreach(@file_path, headers: true) do |row|
        unless valid_store?(row["store"])
          errors << "store不正: #{row['name']}"
          next
        end

        records << {
          code: row["code"],
          name: row["name"],
          store: row["store"],
          updated_at: Time.current,
          created_at: Time.current
        }
      end
        
      #既存データ更新、新規データ作成
      Product.upsert_all(records, unique_by: :code) if records.any?

      { count: records.size, errors: errors }

    end

    private

    def valid_store?(store)
      %w[セブンイレブン ローソン ファミリーマート].include?(store)
    end
  end
end

