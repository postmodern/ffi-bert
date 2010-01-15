class Tuple < Array

  def inspect
    '{' + self.map { |elem| elem.inspect }.join(', ') + '}'
  end

end
