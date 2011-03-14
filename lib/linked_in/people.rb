module LinkedIn
  class People < LinkedIn::Base

    %w[total start count].each do |f|
      define_method(f.to_sym) do
        @doc.xpath('.//people').first["#{f.gsub(/_/,'-')}"].to_i
      end
    end

    def profiles(xpath = "people")
      @array ||= begin
        @array = []
        @doc.xpath("//#{xpath}").children.each do |profile|
          @array << Profile.new(Nokogiri::XML(profile.to_xml)) unless profile.blank?
        end
        @array
      end
    end

    def related_connections
      profiles("related-connections")
    end
  end
end
