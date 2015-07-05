module CukeSlicer
  class DirectoryExtractor

    def extract(target, filters, format, &block)
      Array.new.tap do |test_cases|
        target.feature_files.each do |feature_file|
          test_cases.concat(FileExtractor.new(feature_file, filters, format, &block).extract)
        end

        target.directories.each do |directory|
          test_cases.concat(extract(directory, filters, format, &block))
        end
      end
    end

  end
end
