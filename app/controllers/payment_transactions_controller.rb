class PaymentTransactionsController < ApplicationController
           
    before_action :set_payment_transaction, only: %i[ show update destroy ]

    def index
        @payment_transactions = PaymentTransaction.all
        render json: @payment_transactions
    end

    def show
        render json: @payment_transaction
    end

    def create
        @payment_transaction = PaymentTransaction.create!(parking_space_params)

        if @payment_transaction.save
            render json: @payment_transaction
        end
    end

    def update

        if @payment_transaction.update(parking_space_params)
            render json: @payment_transaction, status: :created
        else
            render json: @payment_transaction.errors, status: :unprocessable_entity
        end

    end

    def destroy
        @payment_transaction.destroy
    end


    private

    def set_payment_transaction
        @payment_transaction = PaymentTransaction.find(params[:id])
    end

    def parking_space_params
        params.require(:payment_transaction).permit(:name)
    end

end
