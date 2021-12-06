class Base
    def initialize(args)
        args.each { |k,v| instance_variable_set("@#{k}", v)}
    end
end