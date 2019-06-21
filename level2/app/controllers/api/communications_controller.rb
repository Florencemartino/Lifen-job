class Api::CommunicationsController < ApplicationController

  def create
    practitioner = Practitioner.find_by(first_name: communication_params[:first_name], last_name: communication_params[:last_name])
    communication = Communication.new(practitioner: practitioner, sent_at: communication_params[:sent_at])
    communication.save
    render json: communication.to_json
  end

  def index
    @communications =  Communication.all.paginate(:page => params[:page], :per_page => 30)
      group_by_practitioner = @communications.group_by do |communication|
         " #{communication.practitioner.first_name} #{communication.practitioner.last_name} "
      end
    render :json => group_by_practitioner.to_json
  end

  def communication_params
    params.require(:communication).permit(:first_name, :last_name, :sent_at)
  end

end
