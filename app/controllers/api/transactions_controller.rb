module API
  class TransactionsController < APIController
    include ActionView::Helpers::NumberHelper

    before_action :set_query_helper

    def summary
      render json: {
        total_revenue: number_to_currency(@query_helper.get_total_revenue * 0.01),
        average_revenue_per_order: number_to_currency(@query_helper.get_average_revenue_per_order * 0.01),
        number_of_distinct_customers: @query_helper.get_number_of_distinct_customers
      }
    end

    def monthly_revenue
      result = @query_helper.get_revenue_by_month.map do |month, revenue|
        [month, revenue * 0.01]
      end

      render json: result
    end

    private

    def set_query_helper
      @query_helper = TransactionsQuery.new(country: params[:country])
    end
  end
end
