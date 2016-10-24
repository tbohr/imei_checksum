# Description on http://www.pruefziffernberechnung.de/I/IMEI.shtml
class ImeiChecksum

  def self.check(imei)
    return nil if imei.blank?

    _g  = 0

    # step 1 && 2
    imei.to_s.split("").each_with_index do |v, i|
      if i % 2 == 0
        _q = v.to_i*1
      else
        _q = v.to_i*2
      end
      _g  += quersumme(_q)
    end

    # step 3: mod 10 && 10 - X
    _g = _g % 10
    _g = 10 - _g

    _g
  end

  # quersumme
  private
  def self.quersumme(val)
    _r = 0
    val.to_s.split("").each do |v|
      _r += v.to_i
    end
    return _r
  end
end
