require File.expand_path 'test_helper.rb', File.dirname(__FILE__)

class TestAll < MiniTest::Test

  class MyCache
    include TmpCache::Prototype
  end

  def setup
    @cache = TmpCache::Cache.new
    @my_cache = MyCache.new

    TmpCache.set('name', 'class', 2)
    @cache.set('name', 'instance', 2)
    MyCache.set('name', 'class mix', 2)
    @my_cache.set('name', 'instance mix', 2)
  end

  def teardown
    TmpCache.reset
    MyCache.reset
  end

  def test_get
    assert TmpCache.get('name') == 'class'
    assert @cache.get('name') == 'instance'
    assert MyCache.get('name') == 'class mix'
    assert @my_cache.get('name') == 'instance mix'
  end

  def test_expire
    sleep 3
    assert TmpCache.get('name') == nil
    assert @cache.get('name') == nil
    assert MyCache.get('name') == nil
    assert @my_cache.get('name') == nil
  end

  def test_reset
    TmpCache.reset
    @cache.reset
    MyCache.reset
    @my_cache.reset
    assert TmpCache.get('name') == nil
    assert @cache.get('name') == nil
    assert MyCache.get('name') == nil
    assert @my_cache.get('name') == nil
  end

  def test_keys
    [TmpCache, @cache, MyCache, @my_cache].each do |i|
      i.set('mail', 'hashimoto@shokai.org')
    end
    [TmpCache, @cache, MyCache, @my_cache].each do |i|    
      assert i.keys.sort == ['name', 'mail'].sort
    end
  end

  def test_values
    assert TmpCache.values == ['class']
    assert @cache.values == ['instance']
    assert MyCache.values == ['class mix']
    assert @my_cache.values == ['instance mix']
  end

  def test_gc
    TmpCache.set('mail', 'hashimoto@shokai.org')
    @cache.set('mail', 'hashimoto@shokai.org')
    MyCache.set('mail', 'hashimoto@shokai.org')
    @my_cache.set('mail', 'hashimoto@shokai.org')
    sleep 3
    assert TmpCache.keys == ['mail']
    assert @cache.keys == ['mail']
    assert MyCache.keys == ['mail']
    assert @my_cache.keys == ['mail']
  end
end
