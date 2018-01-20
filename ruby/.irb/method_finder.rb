# Add mega_clone to top level object
class Object
  # MethodFinder
  # Clone fails on numbers, but they're immutable anyway
  def mega_clone
    begin self.clone; rescue; self; end
  end

  def what?(*a)
    MethodFinder.new(self, *a)
  end
end

# MethodFinder is a class to find methods on objects
class MethodFinder
  # Find all methods on [an_object] which, when called with [args] return [expected_result]
  def self.find(an_object, expected_result, *args)
    an_object.methods.select { |name| an_object.method(name).arity == args.size }.select do |name|
      begin
        an_object.mega_clone.method(name).call(*args) == expected_result
      rescue
      end
    end
  end

  # Pretty-prints the results of the previous method
  def self.show(an_object, expected_result, *args)
    find(an_object, expected_result, *args).each do |name|
      print "#{an_object.inspect}.#{name}"
      print "(" + args.map {|o| o.inspect}.join(", ") + ")" unless args.empty?
      puts " == #{expected_result.inspect}"
    end
  end

  def initialize(obj, *args)
    @obj = obj
    @args = args
  end

  def ==(other)
    MethodFinder.show(@obj, other, *@args)
  end
end
