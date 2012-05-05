
module TmpCache
  VERSION = '0.0.3'

  def self.cache
    @@cache ||= Hash.new{|h,k| h = {:expire => 0, :value => nil}}
  end

  def self.set(key, value, expire=nil)
    cache[key] = {
      :value => value,
      :expire => expire ? Time.now.to_i+expire.to_i : nil
    }
    value
  end

  def self.get(key)
    if cache[key][:expire] < Time.now.to_i
      return cache[key][:value] = nil
    else
      return cache[key][:value]
    end
  end

  def self.gc
    cache.each do |k,c|
      if c[:expire] != nil and Time.now.to_i > c[:expire].to_i
        cache.delete k
      end
    end
  end

  def self.reset
    @@cache = nil
  end

  def self.keys
    gc
    cache.keys
  end

  def self.values
    gc
    cache.values.map{|v| v[:value] }
  end

  def self.each(&block)
    gc
    cache.each do |k,v|
      yield k, v[:value]
    end
  end
end
