class Api::CommunicationsController < ApplicationController

  def create
    practitioner = Practitioner.find_by(first_name: communication_params[:first_name], last_name: communication_params[:last_name])
    communication = Communication.new(practitioner_id: practitioner.id, sent_at: communication_params[:sent_at])
    communication.save
    render json: communication.to_json
  end

  def index
    render json: Communication.all.includes(:practitioner).to_json
  end

  def communication_params
    params.require(:communication).permit(:first_name, :last_name, :sent_at)
  end

end
