describe "Module.as_enum" do
  subject do
    klass = Class.new do
      as_enum def simple
        yield 1
        yield 2
      end

      as_enum def complex(a, b = 2, c: , d: 4)
        yield a
        yield b
        yield c
        yield d
      end

      AsEnum.as_enum self, def no_conflict(a)
        yield 1
        yield a
        yield 3
      end
    end

    klass.new
  end

  it "does not change behavior of method when block given" do
    yields = []
    subject.simple { |x| yields << x }
    yields.should eq([1, 2])

    yields = []
    subject.complex(1, c: 3) { |x| yields << x }
    yields.should eq([1, 2, 3, 4])
  end

  it "can turn a simple method into an enumerable" do
    enum = subject.simple
    enum.should be_a Enumerator
    enum.to_a.should eq([1, 2])
  end

  it "can turn a method with arguments into an enumerable" do
    enum = subject.complex(1, c: 3)
    enum.should be_a Enumerator
    enum.to_a.should eq([1, 2, 3, 4])
  end

  it "raises when enumerated if invalid arguments given" do
    expect { subject.complex.to_a }.to raise_error
  end

  it "can be used without monkey patch" do
    enum = subject.no_conflict(2)
    enum.should be_a Enumerator
    enum.to_a.should eq([1, 2, 3])
  end
end
