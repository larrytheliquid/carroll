require "#{File.dirname __FILE__}/../carroll"

def self.share_specs name, &block
  shared_examples_for name do
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
    spec_code "local Ignore in skip end"
    spec_code "Answer = 42", "Answer" => "42"
    spec_code "local LarryTheLiquid in LarryTheLiquid = 1337 Result = LarryTheLiquid end",
              "Result" => "1337"
    spec_code "local X in X = 7 local Y in Y = X  Y2 = Y X2 = X end end",
              "X2" => "7", "Y2" => "7"
    spec_code "local X in local Y in Y = X X = 7 Y2 = Y X2 = X end end",
              "X2" => "7", "Y2" => "7"
    spec_code "local LarryTheLiquid in skip LarryTheLiquid = 42 Result = 42 end",
              "Result" => "42"
    spec_code "local A in local B in A = 1 B = true local C in C = foo A2 = A B2 = B C2 = C end end end",
              "A2" => "1", "B2" => "true", "C2" => "foo"
    spec_code "skip skip local Foo in Foo = false skip Result = Foo end skip", "Result" => "false"
  end
end

# TODO: invalid syntax and semantics specs
