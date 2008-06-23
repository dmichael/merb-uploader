class Soundfiles < Assets
  CONTENT_TYPES = %w{audio/x-aiff audio/x-wav audio/mpeg audio/x-amzaudio}
  def create
    @asset = Asset.new(params[:asset])
    
    if CONTENT_TYPES.include?(@asset.content_type)    
      @asset.save ? success = @asset.name : success=false
      errors = "errors=#{@asset.errors.on :filename}|#{@asset.errors.on :name}"
    else
      success=false
      errors = "errors=Please only upload audio files."
    end
    if success == false
      
      #redirect "#{request.protocol}#{request.env["HTTP_HOST"]}#{request.uri}"
    end
      redirect "#{request.env['HTTP_REFERER'].split("?").first}?success=#{success}&#{errors}"
  end
end