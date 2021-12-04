module Input
    def self.get_file_lines(filename)
        file(filename)&.readlines(chomp:true) || []
    end

    def self.file(filename)
        @file ||= File.new(file_path(filename))
    end

    def self.file_path(filename)
        File.join(root_path, filename)
    end

    def self.root_path
        Dir.pwd
    end
end
