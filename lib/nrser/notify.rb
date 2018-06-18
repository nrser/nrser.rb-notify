# encoding: UTF-8
# frozen_string_literal: true

# Requirements
# =======================================================================

# Stdlib
# -----------------------------------------------------------------------

# Deps
# -----------------------------------------------------------------------

# Need {NRSER::Log}, etc.
require 'nrser'

# Need {NRSER::LazyAttr} decorator.
require 'nrser/meta/lazy_attr'

require 'terminal-notifier'

# Project / Package
# -----------------------------------------------------------------------

require_relative './notify/version'


# Namespace
# =======================================================================

module NRSER


# Definitions
# =======================================================================

module Notify
  extend ::MethodDecorators
  
  +NRSER::LazyAttr
  # Is the `terminal-notifier` gem available?
  # 
  # [terminal-notifier][] is not an NRSER dependency since it does not make
  # sense for many systems and situations. It must be installed separately.
  # 
  # [terminal-notifier]: https://rubygems.org/gems/terminal-notifier
  # 
  # Tests by trying to `require` it.
  # 
  # @return [Boolean]
  # 
  def self.terminal_notifier?
    begin
      require 'terminal-notifier'
    rescue LoadError => error
      false
    else
      TerminalNotifier.available?
    end
  end # .terminal_notifier?
  
  
  +NRSER::LazyAttr
  # Can we send notification to the user?
  # 
  # Right now, only {.terminal_notifier?} is tested, but we can add more
  # options in the future.
  # 
  # @return [Boolean]
  # 
  def self.available?
    terminal_notifier?
  end # .available?
  
  
  # Send a notification to the use *if* notifications are {.available?}.
  # 
  def self.notify message, **options, &block
    return false unless available?
    notify! message, **options, &block
  end
  
  
  # Force sending of a notification regardless of {.available?}.
  # 
  def self.notify! message, **options, &block
    require 'terminal-notifier'
    TerminalNotifier.notify message, **options, &block
  end
  
end


# /Namespace
# =======================================================================

end # module NRSER
