#!/usr/bin/env ruby
require 'rubygems'
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'tmp_cache'

TmpCache.set('name', 'shokai', 2) # expire 2 sec
puts TmpCache.get('name') # => 'shokai'
sleep 3
puts TmpCache.get('name') # => nil


TmpCache.set('name', 'shokai')
TmpCache.set('mail', 'hashimoto@shokai.org')
TmpCache.each do |k,v|
  puts "#{k} => #{v}"
end
