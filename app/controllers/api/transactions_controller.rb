module API
  class TransactionsController < APIController
    before_action :set_query_helper

    def summary
      render json: {
        total_revenue: @query_helper.get_total_revenue,
        average_revenue_per_order: @query_helper.get_average_revenue_per_order,
        number_of_distinct_customers: @query_helper.get_number_of_distinct_customers
      }
    end

    def monthly_revenue
      render json: @query_helper.get_revenue_by_month
    end

    private

    def set_query_helper
      @query_helper = TransactionsQuery.new(country: params[:country])
    end
  end
end
