#!/usr/bin/ruby
#
#
require 'digest/md5'
require 'hashdiff'
require 'pp'

orig_dir = ARGV.shift
dest_dir = ARGV.shift

def listmd5 dir
  list = Hash.new
  Dir.open(dir).sort.each do |f|
    print "."
    fn = dir + '/' + f
    next unless File.file? fn
    m = Digest::MD5.file(fn).to_s
    list[f] = m
  end
  puts ''
  return list
end

def printdirhash dir, h
  puts "#{dir} :"
  h.each do |k,v|
    puts " #{k} => #{v}"
  end
end

print "compare #{orig_dir} "
orig_list = listmd5 orig_dir
print "with #{dest_dir} "
dest_list = listmd5 dest_dir

diff = HashDiff.diff(orig_list, dest_list)

unless diff.empty?
  printdirhash orig_dir, orig_list
  printdirhash dest_dir, dest_list
#  diff_files = Array.new
#  diff.each do |d|
#
  pp diff
end

