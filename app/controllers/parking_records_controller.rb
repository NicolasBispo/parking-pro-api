class ParkingRecordsController < ApplicationController
    
    before_action :set_parking_record, only: %i[ show update destroy ]

    def index
        @parking_records = ParkingRecord.all
        render json: @parking_records
    end

    def show
        render json: @parking_record
    end

    def create
        @parking_record = ParkingRecord.create!(parking_record_params)

        if @parking_record.save
            render json: @parking_record
        end
    end

    def update

        if @parking_record.update(parking_record_params)
            render json: @parking_record, status: :created
        else
            render json: @parking_record.errors, status: :unprocessable_entity
        end

    end

    def destroy
        @parking_record.destroy
    end


    private

    def set_parking_record
        @parking_record = ParkingRecord.find(params[:id])
    end

    def vehicle_params
        params.require(:parking_record).permit(:name)
    end

end
