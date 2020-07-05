module API
  class CountriesController < APIController
    def index
      render json: CountriesQuery.new.get_all
    end
  end
end
