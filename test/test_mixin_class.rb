require File.dirname(__FILE__) + '/test_helper.rb'

class TestMixinClass < Test::Unit::TestCase

  class MyCache
    include TmpCache::Prototype

    def self.size
      self.keys.size
    end
  end

  def setup
    MyCache.set('name', 'shokai', 2)
  end

  def test_class_method
    assert MyCache.size == 1
    sleep 3
    assert MyCache.size == 0
  end

  def test_get
    assert MyCache.get('name') == 'shokai'
  end

  def test_expire
    sleep 3
    assert MyCache.get('name') == nil
  end

  def test_reset
    MyCache.reset
    assert MyCache.get('name') == nil
  end

  def test_keys
    MyCache.set('mail', 'hashimoto@shokai.org')
    assert MyCache.keys.sort == ['name', 'mail'].sort
  end

  def test_values
    assert MyCache.values == ['shokai']
  end

  def test_gc
    MyCache.set('mail', 'hashimoto@shokai.org')
    sleep 3
    assert MyCache.keys == ['mail']
  end
end
