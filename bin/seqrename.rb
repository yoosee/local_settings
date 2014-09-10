#!/usr/bin/ruby
#

dir = "."

s = 1

Dir.entries(dir).sort.each do |filename|
  next unless /\.(jpg|png)/i =~ filename
  suffix = $1
  origname = filename
  newname = sprintf "%04i.%s", s, suffix.downcase
  suffix = $1
  while File.exist? newname 
    puts "E: #{newname} already exists"
    s += 1
    newname = sprintf "%04i.%s", s, suffix.downcase
  end
  puts "#{origname} => #{newname}"
  s += 1
  begin 
    File.rename origname, newname
  rescue
    puts "E: $!"
  end
end

