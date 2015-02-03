#!/usr/bin/ruby
#
# script to find duplicate file.
#  1. to compaire file size
#  2. to compaire checksum if #1 is the same
#

files = ARGV

file_size = Hash.new

files.each do |file|
  size = File.size file
	file_size[file] = size
#  puts "#{file}: #{size}"
end

file_size.each do |file, size|
