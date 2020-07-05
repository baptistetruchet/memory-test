class TransactionsQuery
  def initialize(country: nil)
    @country = country.to_s
  end

  def get_total_revenue
    execute_query <<~SQL
      SELECT SUM(t.quantity * t.unit_price_cents) AS total_revenue
      FROM transactions t
      #{filter_statements}
    SQL
  end

  def get_average_revenue_per_order
    execute_query <<~SQL
      SELECT AVG(order_amount) AS avg_order_amount
      FROM (
        SELECT SUM(t.quantity * t.unit_price_cents) AS order_amount
        FROM transactions t
        #{filter_statements}
        GROUP BY t.order_id
      )
    SQL
  end

  def get_number_of_distinct_customers
    execute_query <<~SQL
      SELECT COUNT(DISTINCT t.customer_id) AS count_distinct_customers
      FROM transactions t
      #{filter_statements}
    SQL
  end

  def get_revenue_by_month
    sql = <<~SQL
      SELECT strftime("%Y-%m", t.date) AS month_of_transaction,
             SUM(t.quantity * t.unit_price_cents) AS month_revenue
      FROM transactions t
      #{filter_statements}
      GROUP BY month_of_transaction
      ORDER BY month_of_transaction ASC
    SQL

    ActiveRecord::Base.connection.exec_query(sql).rows
  end

  private

  def execute_query(sql)
    ActiveRecord::Base.connection.execute(sql).first.values.first || 0
  end

  def filter_statements
    return unless @country.present?

    ActiveRecord::Base.sanitize_sql_array(["WHERE lower(t.country) = ?", @country.downcase])
  end
end
