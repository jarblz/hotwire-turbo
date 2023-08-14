# frozen_string_literal: true

require 'csv'
namespace :db do
  desc 'This task does nothing'
  task :load_stockers_from_file, %i[file_name state] => :environment do |_, args|
    path = Rails.root.join('db', 'stockers', args.file_name)
    CSV.foreach(path) do |row|
      stocker_ingestion_params = {
        date_stocked: row[0],
        species: row[1],
        quantity: row[2],
        avg_length: row[3],
        address: row[4],
        county: row[5],
        state: args.state
      }
      puts row.inspect
      StockerIngestionService.call(stocker_ingestion_params)
    end
  end
end
