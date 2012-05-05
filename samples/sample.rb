#!/usr/bin/env ruby
require 'rubygems'

## $:.push File.dirname(__FILE__)+'/../lib'

require 'tmp_cache'

TmpCache.set('name', 'shokai', 2)
puts TmpCache.get('name')
sleep 3
puts TmpCache.get('name')


TmpCache.set('name', 'shokai')
TmpCache.set('mail', 'hashimoto@shokai.org')
TmpCache.each do |k,v|
  puts "#{k} => #{v}"
end
