module VagrantWindows
  
  # Provides a wrapper around the Vagrant machine object
  class WindowsMachine
    
    attr_reader :machine
    
    # @param [Machine] The Vagrant machine object
    def initialize(machine)
      @machine = machine
    end
    
    # Checks to see if the machine is using VMWare Fusion or Workstation.
    #
    # @return [Boolean]
    def is_vmware()
      @machine.provider_name.to_s().start_with?('vmware')
    end
    
    # Returns the active WinRMShell for the guest.
    #
    # @return [WinRMShell]
    def winrmshell()
      @machine.communicate.winrmshell
    end

    # Reads the machine's MAC addresses keyed by interface index.
    # {1=>"0800273FAC5A", 2=>"08002757E68A"}
    #
    # @return [Hash]
    def read_mac_addresses()
      @machine.provider.driver.read_mac_addresses
    end
    
    def windows_config()
      @machine.config.windows
    end
    
    def winrm_config()
      @machine.config.winrm
    end
    
  end
end