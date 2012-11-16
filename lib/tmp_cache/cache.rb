module TmpCache

  module Prototype

    def self.included(klass)
      klass.extend Methods
      klass.__send__ :include, Methods
    end

    def self.apply(object)
      object.extend Methods
    end


    module Methods
      def cache
        @cache ||= Hash.new{|h,k| h = {:expire => 0, :value => nil}}
      end

      def set(key, value, expire=nil)
        cache[key] = {
          :value => value,
          :expire => expire ? Time.now.to_i+expire.to_i : nil
        }
        value
      end

      def get(key)
        if cache[key][:expire] < Time.now.to_i
          return cache[key][:value] = nil
        else
          return cache[key][:value]
        end
      end

      def gc
        cache.each do |k,c|
          if c[:expire] != nil and Time.now.to_i > c[:expire].to_i
            cache.delete k
          end
        end
      end

      def reset
        @cache = nil
      end

      def keys
        gc
        cache.keys
      end

      def values
        gc
        cache.values.map{|v| v[:value] }
      end

      def each(&block)
        gc
        cache.each do |k,v|
          yield k, v[:value]
        end
      end
    end

  end

end
