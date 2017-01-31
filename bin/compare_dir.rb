#!/usr/bin/ruby
#
#
require 'digest/md5'

orig_dir = ARGV.shift
dest_dir = ARGV.shift

puts "compare #{orig_dir} with #{dest_dir}"

orig_list = Hash.new
dest_list = Hash.new

Dir.open(orig_dir).sort.each do |f|
  fo = orig_dir + '/' + f
  fd = dest_dir + '/' + f
  next unless File.file? fo
  if File.exists? fd
    mo = Digest::MD5.file(fo).to_s
    md = Digest::MD5.file(fd).to_s
    if mo == md
      puts "[SAME] #{fo} == #{fd}"
      puts "  #{File.open(fo).size} : #{File.open(fd).size}"
    else
      puts "[DIFF] #{fo} #{mo} : #{fd} #{md}"
      puts "  #{File.open(fo).size} : #{File.open(fd).size}"
    end
  else
    puts "[NONE] #{fd} not exists."
  end
end


