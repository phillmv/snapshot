module EberTech
  module Snapshot
    class AbstractCommand < ::Clamp::Command
      attr_accessor :database
      attr_accessor :shell
      
      option "--dry-run", :flag, "Dry run"  
      option "--force", :flag, "Force the operation", :default => false
      option "--quiet", :flag, "Suppress output", :default => false      
      
      def initialize(*args)
        super
        self.shell = Thor::Shell::Color.new
        self.database = Configuration.load.try(:database)
      end
      
      def base_options        
        {
          :pretend => dry_run?,
          :force => force?,
          :quiet => quiet?
        }                                  
      end      
    end
  end
end