# encoding: UTF-8
# frozen_string_literal: true


# Requirements
# ========================================================================

# Project / Package
# ------------------------------------------------------------------------

# Need {NRSER::Log::Plugin}
require 'nrser/log/plugin'


# Refinements
# =======================================================================


# Namespace
# =======================================================================

module  NRSER
module  Log
module  Plugins


# Definitions
# =======================================================================

# 
# 
class Notify < NRSER::Log::Plugin
  
  @method_name = :notify
  
  
  # Attributes
  # ========================================================================
  
  # @return [#to_s]
  #   The `:activate` option value.
  attr_reader :activate
  
  
  # @return [#to_s]
  #   The `:open` option value.
  attr_reader :open
  
  
  # @return [#to_s]
  #   The `:execute` option value.
  attr_reader :execute
  
  
  # @return [#to_s]
  #   The `:sender` option value.
  attr_reader :sender
  
  
  # @return [#to_s]
  #   The `:sound` option value.
  attr_reader :sound
  
  
  # Construction
  # ========================================================================
  
  def initialize  logger,
                  title: nil,
                  subtitle: nil,
                  group: nil,
                  activate: nil,
                  open: nil,
                  execute: nil,
                  sender: nil,
                  sound: nil,
                  icon: nil
    super logger
    @title = title
    @subtitle = subtitle
    @group = group
    @activate = activate
    @open = open
    @execute = execute
    @sender = sender
    @sound = sound
    @icon = icon
  end
  
  
  # Instance Methods
  # ========================================================================
  
  def title level
    @title || "#{ level.to_s.upcase } - #{ logger.name }"
  end
  
  
  def subtitle
    @subtitle
  end
  
  
  def icon level
    @icon || NRSER::Notify::ROOT / 'assets' / 'notify' / "#{ level }.png"
  end
  
  
  def group
    return @group unless @group.nil?
    
    if SemanticLogger.application != 'Semantic Logger'
      return SemanticLogger.application
    end
    
    $0 # or Process.pid ?
  end
  
  
  # Get the options for {NRSER::Notify.notify} for a log call.
  # 
  # @note
  #   Right now, {NRSER::Notify.notify} only supports [terminal-notifier][]
  #   as a backend, and passes the options directly, so these are really the
  #   options for {TerminalNotifier.notify}.
  # 
  # @return [Hash<Symbol, String>]
  #   
  def options level:, message:, payload:, exception:
    {
      title: title( level ),
      subtitle: subtitle,
      group: group,
      activate: activate,
      open: open,
      execute: execute,
      sender: sender,
      sound: sound,
      appIcon: icon( level ),
    }.compact.transform_values &:to_s
  end
  
  
  # Handle a log call. Calls `super`, and if that indicates that the log was
  # sent then dispatches the notification¹.
  # 
  # > ¹ Except for `trace` level log messages - we never notify of those.
  # 
  # @param (see NRSER::Log::Plugin#call)
  # 
  # @return [Boolean]
  #   `true` if the log was sent (met level and not filtered).
  # 
  # def call level, message = nil, payload = nil, exception = nil, &block
  def call level:, message:, payload:, exception:, metric:, &block
    super.tap { |was_logged|
      # TODO  Doesn't seem the return value *totally* represents if the log was
      #       sent or not... there's some additional logic?
      # 
      # Also, we never notify for `trace` log messages regardless of log level.
      # 
      if level != :trace && was_logged
        NRSER::Notify.notify \
          message,
          **options(
            level: level,
            message: message,
            payload: payload,
            exception: exception,
          )
      end
    }
  end # #call
  
end # class Notify


# /Namespace
# =======================================================================

end # module Plugins
end # module Log
end # module NRSER
