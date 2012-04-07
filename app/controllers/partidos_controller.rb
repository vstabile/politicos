class PartidosController < ApplicationController
  # GET /partidos
  # GET /partidos.json
  def index
    @partidos = Partido.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @partidos }
    end
  end

  # GET /partidos/1
  # GET /partidos/1.json
  def show
    @partido = Partido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @partido }
    end
  end

  # GET /partidos/new
  # GET /partidos/new.json
  def new
    @partido = Partido.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @partido }
    end
  end

  # GET /partidos/1/edit
  def edit
    @partido = Partido.find(params[:id])
  end

  # POST /partidos
  # POST /partidos.json
  def create
    @partido = Partido.new(params[:partido])

    respond_to do |format|
      if @partido.save
        format.html { redirect_to @partido, notice: 'Partido was successfully created.' }
        format.json { render json: @partido, status: :created, location: @partido }
      else
        format.html { render action: "new" }
        format.json { render json: @partido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /partidos/1
  # PUT /partidos/1.json
  def update
    @partido = Partido.find(params[:id])

    respond_to do |format|
      if @partido.update_attributes(params[:partido])
        format.html { redirect_to @partido, notice: 'Partido was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @partido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partidos/1
  # DELETE /partidos/1.json
  def destroy
    @partido = Partido.find(params[:id])
    @partido.destroy

    respond_to do |format|
      format.html { redirect_to partidos_url }
      format.json { head :no_content }
    end
  end
end
