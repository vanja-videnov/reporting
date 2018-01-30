class FaktorsController < ApplicationController
  before_action :set_incident
  before_action :set_incident_faktor, only: [:show, :update, :destroy]

  # GET /incidents/:incident_id/faktors
  def index
    json_response(@incident.faktori)
  end

  # GET /incidents/:incident_id/faktors/:id
  def show
    json_response(@faktor)
  end

  # POST /incidents/:incident_id/faktors
  def create
    @incident.faktori.create!(faktor_params)
    json_response(@incident, :created)
  end

  # PUT /incidents/:incident_id/faktors/:id
  def update
    @faktor.update(faktor_params)
    head :no_content
  end

  # DELETE /incidents/:incident_id/faktors/:id
  def destroy
    @faktor.destroy
    head :no_content
  end

  private

    def faktor_params
      params.permit(:ljudstvo_id, :oprema_id, :primena_lekova_id, :incident_id)
    end

    def set_incident
      @incident = Incident.find(params[:incident_id])
    end

    def set_incident_faktor
      @faktor = @incident.faktori.find_by!(id: params[:id]) if @incident
    end
end
