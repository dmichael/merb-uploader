# %f     Filename without the path [string]
#       %F     Filename with the path [string]
#       %k     File size in KB [integer]
#       %a     Artist [string]
#       %c     Comment [string]
#       %g     Musical genre [string]
#       %G     Musical genre number [integer]
#       %l     Album name [string]
#       %n     Track [integer]
#       %t     Track Title [string]
#       %y     Year [string]
#       %C     Copyright flag [string]
#       %e     Emphasis [string]
#       %E     CRC Error protection [string]
#       %L     MPEG Layer [string]
#       %O     Original material flag [string]
#       %o     Stereo/mono mode [string]
#       %p     Padding [string]
#       %v     MPEG Version [float]
#       %u     Number of good audio frames [integer]
#       %b     Number of corrupt audio frames [integer]
#       %Q     Sampling frequency in Hz [integer]
#       %q     Sampling frequency in KHz [integer]
#       %r     Bit Rate in KB/s (type and meaning affected by -r option)
#       %m     Playing time: minutes only [integer]
#       %s     Playing time: seconds only [integer] (usually used in conjunction with %m)
#       %S     Total playing time in seconds [integer]
#       %%     A single percent sign
class Mp3Info
  require 'json'
  attr_accessor :data, :params

  def initialize(path_to_file)
    self.params = {}

    if `which mp3info`
      vals = "%m|%s|%r|%q"#|%a|%c|%l|%y|%t"
      keys = %w{minutes seconds bit_rate sampling_frequency}
      
      self.data = `mp3info -p '#{vals}' #{path_to_file}`.to_s.split('|')
      
      self.data.each_with_index do |param, i|
        self.params["#{keys[i]}"] = param
      end
    end
  end
  
end