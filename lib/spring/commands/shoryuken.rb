require "spring/commands/shoryuken/version"

# We have to define Shoryuken::CLI so that Shoryuken.configure_server blocks
# will run during preloading.
module Shoryuken
  module CLI; end
end

module Spring
  module Commands
    class Shoryuken
      def env(*_)
        "development"
      end

      def exec_name
        "shoryuken"
      end
    end

    Spring.register_command "shoryuken", Shoryuken.new
  end
end
