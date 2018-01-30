class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :update, :destroy]

  # GET /incidents
  def index
    @incidents = Incident.all
    json_response(@incidents)
  end

  # POST /incidents
  def create
    @incident = Incident.create!(incident_params)
    json_response(@incident, :created)
  end

  # GET /incidents/:id
  def show
    json_response(@incident)
  end

  # PUT /incidents/:id
  def update
    @incident.update(incident_params)
    head :no_content
  end

  # DELETE /incidents/:id
  def destroy
    @incident.destroy
    head :no_content
  end

  private

    def incident_params
      # whitelist params
      params.permit(:tip_ucesnika_id, :starost_bolesnika_id, :pol_id, :asa_klasifikacija_id,
      :mesto_id, :tip_incidenta_id, :opis, :misljenje, :moguce_preventirati, :preduzeto_id,
      :ishod_id, :uticaj_na_razresenje_id, :vaznost_razresenja, :ocekivanje_id, :datum, :tip_ustanove_id)
    end

    def set_incident
      @incident = Incident.find(params[:id])
    end
end
