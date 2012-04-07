class OrgaosController < ApplicationController
  # GET /orgaos
  # GET /orgaos.json
  def index
    @orgaos = Orgao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orgaos }
    end
  end

  # GET /orgaos/1
  # GET /orgaos/1.json
  def show
    @orgao = Orgao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @orgao }
    end
  end

  # GET /orgaos/new
  # GET /orgaos/new.json
  def new
    @orgao = Orgao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @orgao }
    end
  end

  # GET /orgaos/1/edit
  def edit
    @orgao = Orgao.find(params[:id])
  end

  # POST /orgaos
  # POST /orgaos.json
  def create
    @orgao = Orgao.new(params[:orgao])

    respond_to do |format|
      if @orgao.save
        format.html { redirect_to @orgao, notice: 'Orgao was successfully created.' }
        format.json { render json: @orgao, status: :created, location: @orgao }
      else
        format.html { render action: "new" }
        format.json { render json: @orgao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orgaos/1
  # PUT /orgaos/1.json
  def update
    @orgao = Orgao.find(params[:id])

    respond_to do |format|
      if @orgao.update_attributes(params[:orgao])
        format.html { redirect_to @orgao, notice: 'Orgao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @orgao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orgaos/1
  # DELETE /orgaos/1.json
  def destroy
    @orgao = Orgao.find(params[:id])
    @orgao.destroy

    respond_to do |format|
      format.html { redirect_to orgaos_url }
      format.json { head :no_content }
    end
  end
end
