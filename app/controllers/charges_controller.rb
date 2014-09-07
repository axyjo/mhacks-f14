class ChargesController < ApplicationController
  # POST /charges
  # POST /charges.json
  def create
    @charge = current_user.charges.new(charge_params)

    respond_to do |format|
      if @charge.save
        format.html { redirect_to current_user, notice: 'Charge was successfully created.' }
        format.json { render :show, status: :created }
      else
        format.html { redirect_to current_user, alert: 'Charge was not processed.' }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge
      @charge = Charge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_params
      params[:charge].permit(:reward_id, :token)
    end
end
