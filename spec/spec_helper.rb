require "#{File.dirname(__FILE__)}/../carroll"

def self.share_specs(name, &block)
  shared_examples_for(name) do
    describe(":: #{name} ::", &block)
  end
end

puts "\n=== Carroll language specifications ==="

share_specs "value expressions" do
  describe "<atom>" do
    %w[a foo bar larrytheliquid x1 var3].each do |atom|
      spec_code atom
    end
  end
  
  describe "<int>" do
    %w[0 1 2 7 45 1337].each do |int|
      spec_code int
    end
  end
  
  describe "<bool>" do
    spec_code "true"
    spec_code "false"
  end
end

share_specs "statements" do
  describe "<statement>" do
    spec_code "skip"
  end
end

# TODO: invalid syntax and semantics specs
