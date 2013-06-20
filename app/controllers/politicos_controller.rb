class PoliticosController < ApplicationController
  # GET /politicos
  # GET /politicos.json
  def index
    @politicos = Politico.page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @politicos }
    end
  end

  # GET /politicos/1
  # GET /politicos/1.json
  def show
    @politico = Politico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @politico }
    end
  end

  # GET /politicos/new
  # GET /politicos/new.json
  def new
    @politico = Politico.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @politico }
    end
  end

  # GET /politicos/1/edit
  def edit
    @politico = Politico.find(params[:id])
  end

  # POST /politicos
  # POST /politicos.json
  def create
    @politico = Politico.new(params[:politico])

    respond_to do |format|
      if @politico.save
        format.html { redirect_to @politico, notice: 'Politico was successfully created.' }
        format.json { render json: @politico, status: :created, location: @politico }
      else
        format.html { render action: "new" }
        format.json { render json: @politico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /politicos/1
  # PUT /politicos/1.json
  def update
    @politico = Politico.find(params[:id])

    respond_to do |format|
      if @politico.update_attributes(params[:politico])
        format.html { redirect_to @politico, notice: 'Politico was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @politico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /politicos/1
  # DELETE /politicos/1.json
  def destroy
    @politico = Politico.find(params[:id])
    @politico.destroy

    respond_to do |format|
      format.html { redirect_to politicos_url }
      format.json { head :no_content }
    end
  end
end
