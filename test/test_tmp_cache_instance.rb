require File.expand_path 'test_helper.rb', File.dirname(__FILE__)

class TestTmpCacheInstance < MiniTest::Test

  def setup
    @tmp_cache = TmpCache::Cache.new
    @tmp_cache.set('name', 'shokai', 2)
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
