
module TmpCache
  class Cache
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
end
