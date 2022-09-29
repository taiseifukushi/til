require 'gr/plot'

x = []; y = []; z = []

GR.beginprint("video.gif")
              
500.times do |i|
  z <<  i / 100.0
  x <<  i**2 * Math.sin(i * Math::PI / 10.0) / 100.0
  y <<  i**2 * Math.cos(i * Math::PI / 10.0) / 100.0

  GR.plot3(x, y, z, 'p', title: "i = #{i}")
  GR.updatews
  sleep 0.005
end

GR.endprint
