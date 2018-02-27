require 'net/telnet'

class Weather  
  def self.get(city)
    w = Weather::Receiver::new(city)
    w.receive
  end
end

class Weather::Receiver
  HOST = 'rainmaker.wunderground.com'

  def initialize(city)
    @city = city
  end

  def receive
    telnet = Net::Telnet::new(
      'Host' => HOST,
      'Prompt' => /.*/,
      'Timeout' => 10,
      'Waittime' => 2,
      'Telnetmode' => false
    )

    result = telnet.cmd("\n" + @city)
    telnet.close
    result
  end
end
