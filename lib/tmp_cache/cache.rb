
module TmpCache
  class Cache
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
      c = cache[key]
      if c[:expire] != nil and Time.now.to_i > c[:expire].to_i
        return cache[key][:value] = nil
      else
        return cache[key][:value]
      end
    end
end
