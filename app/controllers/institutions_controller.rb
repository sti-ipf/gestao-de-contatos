class InstitutionsController < ApplicationController
  # GET /institutions
  # GET /institutions.json
  def index
    @institutions = Institution.all(:include => [:phones, :emails], :order => 'name ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @institutions }
    end
  end

  # GET /institutions/1
  # GET /institutions/1.json
  def show
    @institution = Institution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @institution }
    end
  end

  # GET /institutions/new
  # GET /institutions/new.json
  def new
    @institution = Institution.new
    @institution.addresses.build
    @institution.phones.build
    @institution.emails.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @institution }
      format.js
    end
  end

  # GET /institutions/1/edit
  def edit
    @institution = Institution.find(params[:id], :include => [:addresses, :phones])
  end

  # POST /institutions
  # POST /institutions.json
  def create
    @institution = Institution.new(params[:institution])
    format_date
    respond_to do |format|
      if @institution.save
        format.html { redirect_to institutions_path, :notice => t('institution.created') }
        format.json { render :json => @institution, :status => :created, :location => @institution }
      else
        @institution.addresses.build
        @institution.phones.build
        @institution.emails.build
        format.html { render :action => "new" }
        format.json { render :json => @institution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /institutions/1
  # PUT /institutions/1.json
  def update
    @institution = Institution.find(params[:id])
    format_date
    respond_to do |format|
      if @institution.update_attributes(params[:institution])
        format.html { redirect_to institutions_path, :notice => t('institution.updated') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @institution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /institutions/1
  # DELETE /institutions/1.json
  def destroy
    @institution = Institution.find(params[:id])
    @institution.destroy

    respond_to do |format|
      format.html { redirect_to institutions_url }
      format.json { head :ok }
    end
  end

protected

  def format_date
    regex = /\d{2}\/\d{2}\/\d{4}/
    if !params[:institution][:fundation_at].blank?
      params[:institution][:fundation_at] = Date.strptime(params[:institution][:fundation_at], '%d/%m/%Y') if (params[:institution][:fundation_at] =~ regex)
    end
  end
end
