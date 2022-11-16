class Company < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
      company_hash = Company.new
      company_hash.name = row[0]
      company_hash.manager = row[1]
      company_hash.status = row[2]
      company_hash.terms = row[3]
      company_hash.save
      # Company.create!
      # row.to_hash
    end
  end
end
