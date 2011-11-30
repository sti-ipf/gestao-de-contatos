module IPF
  class Util

    def self.link_is_a_valid_url?(link)
      url = URI.parse(link)
      @uri.class == URI::HTTP || @uri.class == URI::HTTPS
    end

  end
end