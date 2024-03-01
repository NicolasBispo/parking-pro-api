class VehicleDescriptorsController < ApplicationController

    before_action :set_vehicle_descriptor, only: %i[ show update destroy ]

    def index
        @vehicle_descriptors = VehicleDescriptor.all
        render json: @vehicle_descriptors
    end

    def show
        render json: @vehicle_descriptor
    end

    def create
        @vehicle_descriptor = VehicleDescriptor.create!(vehicle_descriptor_params)

        if @vehicle_descriptor.save
            render json: @vehicle_descriptor
        end
    end

    def update

        if @vehicle_descriptor.update(vehicle_descriptor_params)
            render json: @vehicle_descriptor, status: :created
        else
            render json: @vehicle_descriptor.errors, status: :unprocessable_entity
        end

    end

    def destroy
        @vehicle_descriptor.destroy
    end


    private

    def set_vehicle_descriptor
        @vehicle_descriptor = VehicleDescriptor.find(params[:id])
    end

    def vehicle_params
        params.require(:vehicle_descriptor).permit(:name, :value)
    end

end
