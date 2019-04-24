require "spring/commands/shoryuken/version"

# In a default Shoryuken setup, Shoryuken.configure_server blocks will run for
# the server (when invoked as `shoryuken` on the command line), and
# Shoryuken.configure_client blocks will run otherwise. This won't work with
# Spring, because the client and server processes are forked from the same
# preloaded base.
#
# As a workaround, we can let configure_client blocks run during preloading
# (assuming they are defined in an initializer, as recommended). We also delay
# configure_server blocks until after Spring forks, so they are only run for
# "server" processes. This also has the benefit of avoiding dreaded errors like
# "A copy of MyCustomMiddleware has been removed from the module tree but is
# still active!"

# Make sure it's already loaded
require "shoryuken/options"

module Shoryuken
  class Options
    class << self
      def configure_server
        ::Spring::Commands::Shoryken.configure_server { yield self }
      end
    end
  end
end

module Spring
  module Commands
    class Shoryuken
      @@configure_server_callbacks = []

      def self.configure_server(&blk)
        @@configure_server_callbacks << blk
      end

      def env(*_)
        "development"
      end

      def gem_name
        "shoryuken"
      end

      def exec_name
        "shoryuken"
      end

      def call
        @@configure_server_callbacks.each(&:call)
        load Gem.bin_path(gem_name, exec_name)
      end
    end

    Spring.register_command "shoryuken", Shoryuken.new
  end
end
