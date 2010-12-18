module LinkedIn
  class Base

    def self.from_xml(doc)
      new(Nokogiri::XML(doc))
    end

    def initialize(doc)
      @doc = doc
    end
    
    def to_s
      @doc.to_s
    end
    
    if defined?(Rails)
      def inspect
        Hash.from_xml(@doc.to_s).inspect
      end
    end

  end
end
