class ParkingLotsController < ApplicationController
    before_action :set_parking_lot, only: %i[ show update destroy ]

    def index
        @parking_lots = ParkingLot.all
        render json: @parking_lots
    end

    def show
        render json: @parking_lot
    end

    def create
        @parking_lot = ParkingLot.create!(price_policy_params)

        if @parking_lot.save
            render json: @parking_lot
        end
    end

    def update

        if @parking_lot.update(price_policy_params)
            render json: @parking_lot, status: :created
        else
            render json: @parking_lot.errors, status: :unprocessable_entity
        end

    end

    def destroy
        @parking_lot.destroy
    end


    private

    def set_parking_lot
        @parking_lot = ParkingLot.find(params[:id])
    end

    def parking_lot_params
        params.require(:parking_lot).permit(:name, :hourly_rate, :daily_rate, :valid_from, :valid_until, :is_active)
    end

end
