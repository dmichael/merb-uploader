class Assets < Application
  # provides :xml, :yaml, :js

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
    @asset = Asset.new(params[:asset])
    if @asset.save
      redirect url(:asset, @asset)
    else
      render :new
    end
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

end
