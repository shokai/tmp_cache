$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'tmp_cache/cache'

module TmpCache
  VERSION = '0.0.3'
  include TmpCache::Prototype

  class Cache
    include TmpCache::Prototype
  end
end
