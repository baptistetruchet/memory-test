class CountriesQuery
  def get_all
    sql = <<~SQL
      SELECT DISTINCT t.country AS distinct_countries
      FROM transactions t
    SQL
    
    ActiveRecord::Base.connection.exec_query(sql).rows.flatten
  end
end
