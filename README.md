tmp_cache
=========
on memory cache.

* https://github.com/shokai/tmp_cache


Installation
------------

    % gem install tmp_cache


Usage
-----

```ruby
require 'tmp_cache'

TmpCache.set('name', 'shokai', 60) # expire 60 sec

puts TmpCache.get('name') # => 'shokai'
sleep 61
puts TmpCache.get('name') # => nil

TmpCache.set('name', 'shokai')
TmpCache.set('mail', 'hashimoto@shokai.org')
TmpCache.each do |k,v|
  puts "#{k} => #{v}"
end
```

create new cache

```ruby
cache = TmpCache::Cache.new
cache.set('foo', 'bar')
puts cache.get('foo')
```


Test
----

    % gem install bundler
    % bundle install
    % rake test


Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
