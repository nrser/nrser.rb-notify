module NRSER
  module Notify
    # Absolute, expanded path to the gem's root directory.
    # 
    # Here in `//lib/nrser/version` so that it can be used via
    # 
    #     require 'nrser/version'
    # 
    # without loading the entire module.
    # 
    # @return [Pathname]
    # 
    ROOT = (
      Pathname.new( __FILE__ ).dirname / '..' / '..' / '..'
    ).expand_path
    
    VERSION = (ROOT / 'VERSION').read
  end
end
