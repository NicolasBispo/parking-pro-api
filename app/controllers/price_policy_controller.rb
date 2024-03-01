class PricePolicyController < ApplicationController
    
    before_action :set_price_policy, only: %i[ show update destroy ]

    def index
        @price_policies = PricePolicy.all
        render json: @price_policies
    end

    def show
        render json: @price_policy
    end

    def create
        @price_policy = PricePolicy.create!(price_policy_params)

        if @price_policy.save
            render json: @price_policy
        end
    end

    def update

        if @price_policy.update(price_policy_params)
            render json: @price_policy, status: :created
        else
            render json: @price_policy.errors, status: :unprocessable_entity
        end

    end

    def destroy
        @price_policy.destroy
    end


    private

    def set_price_policy
        @price_policy = PricePolicy.find(params[:id])
    end

    def vehicle_params
        params.require(:price_policy).permit(:name, :hourly_rate, :daily_rate, :valid_from, :valid_until, :is_active)
    end

end
