
class Assets < Application
  # provides :xml, :yaml, :js
  layout false
  def index
    @assets = Asset.all
    display @assets
  end

  def show
    @asset = Asset.first(params[:id])
    raise NotFound unless @asset
    display @asset
  end

  def new
    only_provides :html
    @asset = Asset.new
    render
  end

  def edit
    only_provides :html
    @asset = Asset.first(params[:id])
    raise NotFound unless @asset
    render
  end

  def create
    Merb.logger.debug params[:asset][:user_id]
    @asset = Asset.new(params[:asset])
    Merb.logger.debug @asset.inspect
    @asset.save ? success = @asset.name : success=false
    if success == false
      errors = "errors=#{@asset.errors.on :filename}|#{@asset.errors.on :name}"
      #redirect "#{request.protocol}#{request.env["HTTP_HOST"]}#{request.uri}"
    end
      redirect "#{request.env['HTTP_REFERER'].split("?").first}?success=#{success}&#{errors}"
  end

  def update
    @asset = Asset.first(params[:id])
    raise NotFound unless @asset
    if @asset.update_attributes(params[:asset])
      redirect url(:asset, @asset)
    else
      raise BadRequest
    end
  end

  def destroy
    @asset = Asset.first(params[:id])
    raise NotFound unless @asset
    if @asset.destroy!
      redirect url(:asset)
    else
      raise BadRequest
    end
  end
  
  def progress
    render :update do |page|
      @status = Mongrel::Uploads.check(params[:upload_id])
      page.upload_progress.update(@status[:size], @status[:received]) if @status
    end
  end
  
  def upload
    # SWFUpload file
    if params[:Filedata]
      @asset = Asset.new(:swf_uploaded_data => params["Filedata"])
    else
      @asset = Asset.new(params[:asset])
    end
    
    if @asset.save
      @asset.update_attributes(params[:asset]) if params[:asset] # 'type' is gleaned from class type
      (params[:Filedata]) ? render(" {id:\"#{@asset.id}\"} ") : redirect("#{request.env['HTTP_REFERER'].split("?").first}?success=true")
    else
      (params[:Filedata]) ? render("Server Error", :status => 500) : errors = "errors=#{@asset.errors.on :filename}|#{@asset.errors.on :name}"
    end
    
  end

end
