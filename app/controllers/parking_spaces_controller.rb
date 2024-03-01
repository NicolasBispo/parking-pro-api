class ParkingSpacesController < ApplicationController
        
    before_action :set_parking_space, only: %i[ show update destroy ]

    def index
        @parking_spaces = ParkingSpace.all
        render json: @parking_spaces
    end

    def show
        render json: @parking_space
    end

    def create
        @parking_space = ParkingSpace.create!(parking_space_params)

        if @parking_space.save
            render json: @parking_space
        end
    end

    def update

        if @parking_space.update(parking_space_params)
            render json: @parking_space, status: :created
        else
            render json: @parking_space.errors, status: :unprocessable_entity
        end

    end

    def destroy
        @parking_space.destroy
    end


    private

    def set_parking_space
        @parking_space = ParkingSpace.find(params[:id])
    end

    def parking_space_params
        params.require(:parking_space).permit(:name)
    end

end
