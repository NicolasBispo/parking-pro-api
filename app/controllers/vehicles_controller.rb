class VehiclesController < ApplicationController

    before_action :set_vehicle, only: %i[ show update destroy ]

    def index
        @vehicles = Vehicle.includes(:vehicle_type, :user).all
        render json: @vehicles, include: [:vehicle_type, :user]
      end
      

    def show
        render json: @vehicle
    end

    def create
        @vehicle = Vehicle.create!(vehicle_type_params)

        if @vehicle.save
            render json: @vehicle
        end
    end

    def update

        if @vehicle.update(vehicle_type_params)
            render json: @vehicle, status: :created
        else
            render json: @vehicle.errors, status: :unprocessable_entity
        end

    end

    def destroy
        @vehicle.destroy
    end


    private

    def set_vehicle
        @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
        params.require(:vehicle).permit(:name)
    end

end
