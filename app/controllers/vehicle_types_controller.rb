class VehicleTypesController < ApplicationController

    before_action :set_vehicle, only: %i[ show update destroy ]

    def index
        @vehicle_types = VehicleType.all
        render json: @vehicle_types
    end

    def show
        render json: @vehicle_type
    end

    def create
        @vehicle_type = vehicle_type.create!(vehicle_params)

        if @vehicle_type.save
            render json: @vehicle_type
        end
    end

    def update

        if @vehicle_type.update(vehicle_params)
            render json: @vehicle_type, status: :created
        else
            render json: @vehicle_type.errors, status: :unprocessable_entity
        end

    end

    def destroy
        @vehicle_type.destroy
    end


    private

    def set_vehicle
        @vehicle_type = VehicleType.find(params[:id])
    end

    def vehicle_params
        params.require(:vehicle_type).permit(:plate)
    end

end
