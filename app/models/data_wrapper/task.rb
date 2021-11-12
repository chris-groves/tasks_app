module DataWrapper
  class Task
    attr_reader :data

    def initialize(data)
      @data = HashWithIndifferentAccess.new(data)
    end

    def id
      data[:id]
    end

    def description
      data[:description]
    end
  end
end
