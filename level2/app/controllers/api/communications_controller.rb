#require'date'

class Api::CommunicationsController < ApplicationController

  def create
    practitioner = Practitioner.where(first_name: communication_params[:first_name], last_name: communication_params[:last_name]).first
    communication = Communication.new(practitioner_id: practitioner.id, sent_at: communication_params[:sent_at])
    communication.save
  end

  def index
    #start_date = Time.now
    @communications = Communication.all
    @communications.includes(:practitioner)
    #end_date = Time.now
    #p time = end_date - start_date
    #raise
  end

  def communication_params
    params.require(:communication).permit(:first_name, :last_name, :sent_at)
  end

end
