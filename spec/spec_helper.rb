require "#{File.dirname(__FILE__)}/../carroll"

def self.share_specs(name, &block)
  shared_examples_for(name) do
    describe(":: #{name} ::", &block)
  end
end

puts "\n=== Carroll language ==="

share_specs "Value expressions" do
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

share_specs "Statements" do
  describe "<statement>" do
    spec_code "skip"
    spec_code "LarryTheLiquid = 1337"
    spec_code "skip LarryTheLiquid = 42"
    spec_code "A = 1 B = true C = foo"
    spec_code "skip skip Foo = false skip"    
  end
end

# TODO: invalid syntax and semantics specs
