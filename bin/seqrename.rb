#!/usr/bin/ruby
#

require 'optparse'

Version = '0.9.0'

dir = "."
s = 1

args = {}
OptionParser.new do |parser|
  parser.on('-n', '--numeric', 'Numeric Sort') {|v| args[:numeric] = v}
  parser.on('-d', '--dry-run', 'Dry Run') {|v| args[:dryrun] = v}
  parser.on('-p PREFIX', '--prefix', 'add Prefix to filenames') {|v| args[:prefix] = v.to_s}
  parser.parse! ARGV
end

dir_sorted = Array.new
prefix = args[:prefix] || ''

if args[:numeric] 
  dir_sorted = Dir.entries(dir).sort{|a,b| 
    n_a = a.gsub /[^0-9]/, ""
    n_b = b.gsub /[^0-9]/, ""
    n_a.to_i <=> n_b.to_i
#  n_a = a.scan /(\d+)/
#  n_b = b.scan /(\d+)/ 
#  n_a.flatten.first.to_i <=> n_b.flatten.first.to_i
  }
else 
  dir_sorted = Dir.entries(dir).sort
end

dir_sorted.each do |filename|
  next unless /\.(jpg|jpeg|png)/i =~ filename
  suffix = $1
  suffix = 'jpg' if suffix == 'jpeg'
  origname = filename
  newname = sprintf "%04i.%s", s, suffix.downcase
	newname = prefix + newname
  if File.exist? newname
    puts "E: #{origname} already exists (#{newname}). skipping."
    s += 1
    next
  end
#  while File.exist? newname 
#    puts "E: #{newname} already exists"
#    s += 1
#    newname = sprintf "%04i.%s", s, suffix.downcase
#  end
  puts "#{origname} => #{newname}"
  s += 1
  begin 
    File.rename origname, newname unless args[:dryrun]
  rescue
    puts "E: $!"
  end
end

