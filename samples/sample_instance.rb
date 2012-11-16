#!/usr/bin/env ruby
require 'rubygems'
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'tmp_cache'

cache = TmpCache::Cache.new
cache.set('name', 'shokai', 2) # expire 2 sec
puts cache.get('name') # => 'shokai'
sleep 3
puts cache.get('name') || 'expired' # => nil


cache.set('name', 'shokai')
cache.set('mail', 'hashimoto@shokai.org')
cache.each do |k,v|
  puts "#{k} => #{v}"
end
