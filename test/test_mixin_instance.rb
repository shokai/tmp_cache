require File.dirname(__FILE__) + '/test_helper.rb'

class TestMixinInstance < MiniTest::Unit::TestCase

  class MyCache
    include TmpCache::Prototype

    def size
      keys.size
    end
  end

  def setup
    @tmp_cache = MyCache.new
    @tmp_cache.set('name', 'shokai', 2)
  end

  def test_instance_method
    assert @tmp_cache.size == 1
    sleep 3
    assert @tmp_cache.size == 0
  end

  def test_get
    assert @tmp_cache.get('name') == 'shokai'
  end

  def test_expire
    sleep 3
    assert @tmp_cache.get('name') == nil
  end

  def test_reset
    @tmp_cache.reset
    assert @tmp_cache.get('name') == nil
  end

  def test_keys
    @tmp_cache.set('mail', 'hashimoto@shokai.org')
    assert @tmp_cache.keys.sort == ['name', 'mail'].sort
  end

  def test_values
    assert @tmp_cache.values == ['shokai']
  end

  def test_gc
    @tmp_cache.set('mail', 'hashimoto@shokai.org')
    sleep 3
    assert @tmp_cache.keys == ['mail']
  end
end
