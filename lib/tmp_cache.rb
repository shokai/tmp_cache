
module TmpCache
  VERSION = '0.0.1'

  def self.cache
    @@cache ||= Hash.new{|h,k| h = {:expire => 0, :value => nil}}
  end

  def self.set(key, value, expire=60)
    cache[key] = {:value => value, :expire => Time.now.to_i+expire}
    return value
  end

  def self.get(key)
    if cache[key][:expire] < Time.now.to_i
      return cache[key][:value] = nil
    else
      return cache[key][:value]
    end
  end

  def self.reset
    @@cache = nil
  end

  def self.keys
    cache.keys
  end

  def self.values
    cache.values.map{|v| v[:value] }
  end

  def self.each(&block)
    cache.each do |k,v|
      yield k, v[:value]
    end
  end
end
