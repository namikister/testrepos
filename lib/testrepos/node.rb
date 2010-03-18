module Testrepos
  module Node
    def contents(*params)
      params |= [:id, :name, :notes]
      obj = {}
      params.each{|a|
        obj[a] = begin
                   __send__(a)
                 rescue NoMethodError
                   nil
                 end
      }
      obj['type'] = self.node.type
      return obj
    end
  end
end
