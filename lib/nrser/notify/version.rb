# encoding: UTF-8
# frozen_string_literal: true

# Requirements
# =======================================================================

# Stdlib
# -----------------------------------------------------------------------

require 'pathname'


# Namespace
# =======================================================================

module NRSER


# Definitions
# =======================================================================

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
  
  
  # String version of the gem.
  # 
  # @return [String]
  # 
  VERSION = (ROOT / 'VERSION').read
  
end


# /Namespace
# =======================================================================

end # module NRSER
