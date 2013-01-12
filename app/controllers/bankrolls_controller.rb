class BankrollsController < ApplicationController
  # GET /bankrolls
  # GET /bankrolls.json
  def index
    @bankrolls = Bankroll.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bankrolls }
    end
  end
  def total
    @total = Bankroll.find

  # GET /bankrolls/1
  # GET /bankrolls/1.json
  def show
    @bankroll = Bankroll.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bankroll }
    end
  end

  # GET /bankrolls/new
  # GET /bankrolls/new.json
  def new
    @bankroll = Bankroll.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bankroll }
    end
  end

  # GET /bankrolls/1/edit
  def edit
    @bankroll = Bankroll.find(params[:id])
  end

  # POST /bankrolls
  # POST /bankrolls.json
  def create
    @bankroll = Bankroll.new(params[:bankroll])

    respond_to do |format|
      if @bankroll.save
        format.html { redirect_to @bankroll, notice: 'Bankroll was successfully created.' }
        format.json { render json: @bankroll, status: :created, location: @bankroll }
      else
        format.html { render action: "new" }
        format.json { render json: @bankroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bankrolls/1
  # PUT /bankrolls/1.json
  def update
    @bankroll = Bankroll.find(params[:id])

    respond_to do |format|
      if @bankroll.update_attributes(params[:bankroll])
        format.html { redirect_to @bankroll, notice: 'Bankroll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bankroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bankrolls/1
  # DELETE /bankrolls/1.json
  def destroy
    @bankroll = Bankroll.find(params[:id])
    @bankroll.destroy

    respond_to do |format|
      format.html { redirect_to bankrolls_url }
      format.json { head :no_content }
    end
  end
end
