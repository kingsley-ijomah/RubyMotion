class Color
  PROPERTIES = [:timestamp, :hex, :id, :tags]
  attr_accessor *PROPERTIES

  def initialize(hash = {})
    hash.each { |key, value|
      if PROPERTIES.member? key.to_sym
        self.send((key.to_s + "=").to_s, value) 
      end
    }
  end

  def tags
    @tags ||= []
  end

  def tags=(tags)
    if tags.first.is_a? Hash
      tags = tags.collect { |tag| Tag.new(tag) }
    end
    tags.each { |tag|
      if not tag.is_a? Tag
        raise "Wrong class for attempted tag #{tag.inspect}" 
      end
    }
    @tags = tags
  end

  def self.find(hex, &block) 
    BW::HTTP.get("https://kingsley-ijomah-colr-api-v1.p.mashape.com/#{hex}", 
                 headers: {"X-Mashape-Key" => "zm9YKYkLWRmshsicq4vZPy7GhPS9p1zjCOGjsn8sLUHefDzLqr"}
                ) do |response|
                  result_data = BubbleWrap::JSON.parse(response.body.to_str)
                  color_data = result_data["colors"][0]
                  color = Color.new(color_data)
                  if color.id.to_i == -1
                    block.call(nil)
                  else
                    block.call(color)
                  end
                end 
  end

  def add_tag(tag, &block) 
    BubbleWrap::HTTP.post("http://www.colr.org/js/color/#{self.hex}/addtag/", payload:{tags: tag}) do |response| 
      if response.ok?
        block.call(tag)
      else
        block.call(nil)
      end 
    end
  end

end


