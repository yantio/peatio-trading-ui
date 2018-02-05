require "petio_market_api"
module Private
  class MarketsController < ApplicationController

    layout :false

    def show
      @response = PetioMarketAPI.new(params[:id],request.cookies).fetch(params[:lang])
    end
  end
end
