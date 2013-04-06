require File.dirname(__FILE__) + '/test_helper.rb'

class TestTmpCache < MiniTest::Unit::TestCase

  def setup
    TmpCache.set('name', 'shokai', 2)
  end

  def teardown
    TmpCache.reset
  end

  def test_get
    assert TmpCache.get('name') == 'shokai'
  end

  def test_expire
    sleep 3
    assert TmpCache.get('name') == nil
  end

  def test_reset
    TmpCache.reset
    assert TmpCache.get('name') == nil
  end

  def test_keys
    TmpCache.set('mail', 'hashimoto@shokai.org')
    assert TmpCache.keys.sort == ['name', 'mail'].sort
  end

  def test_values
    assert TmpCache.values == ['shokai']
  end

  def test_gc
    TmpCache.set('mail', 'hashimoto@shokai.org')
    sleep 3
    assert TmpCache.keys == ['mail']
  end
end
