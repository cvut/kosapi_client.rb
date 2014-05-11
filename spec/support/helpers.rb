module Helpers

  def method_name(name=description)
    name[1..-1].to_sym
  end

end
