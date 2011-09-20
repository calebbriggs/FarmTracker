class HerdsController < ApplicationController
  # GET /herds
  # GET /herds.json
  def index
    @herds = Herd.joins(:farm).where(:farms => {:user_id => @logged_user.id})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @herds }
    end
  end

  # GET /herds/1
  # GET /herds/1.json
  def show
    @herd = Herd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @herd }
    end
  end

  # GET /herds/new
  # GET /herds/new.json
  def new
    @herd = Herd.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @herd }
    end
  end

  # GET /herds/1/edit
  def edit
    @herd = Herd.find(params[:id])
  end

  # POST /herds
  # POST /herds.json
  def create
    @herd = Herd.new(params[:herd])

    respond_to do |format|
      if @herd.save
        format.html { redirect_to @herd, :notice => 'Herd was successfully created.' }
        format.json { render :json => @herd, :status => :created, :location => @herd }
      else
        format.html { render :action => "new" }
        format.json { render :json => @herd.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /herds/1
  # PUT /herds/1.json
  def update
    @herd = Herd.find(params[:id])

    respond_to do |format|
      if @herd.update_attributes(params[:herd])
        format.html { redirect_to @herd, :notice => 'Herd was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @herd.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /herds/1
  # DELETE /herds/1.json
  def destroy
    @herd = Herd.find(params[:id])
    @herd.destroy

    respond_to do |format|
      format.html { redirect_to herds_url }
      format.json { head :ok }
    end
  end
end
