class PaymentsController < ApplicationController
  # before_action :authenticate_user!

  def new
    @payment = current_user.payments.new
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
  end

  def create
    @payment = current_user.payments.new(name: payment_params[:name], amount: payment_params[:amount])
    @group = Group.find(params[:group_id])


    if @payment.save
      redirect_to user_group_payments_path(@group, current_user), notice: 'Payment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @payment = Payment.find(params[:id])
    @group = Group.find(params[:group_id])
  end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update(payment_params)
      redirect_to group_path(@payment.group), notice: 'Payment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def payment_params
    # params.require(:payment).permit(:name, :amount, :author_id, groups: {})
    params.require(:payment_item).permit!
  end
end
