require "spring/commands/shoryuken/version"

module Spring
  module Commands
    class Shoryuken
      def env
        "development"
      end

      def exec_name
        "shoryuken"
      end
    end

    Spring.register_command "shoryuken", Shoryuken.new
  end
end
