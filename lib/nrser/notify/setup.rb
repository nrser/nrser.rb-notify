# encoding: UTF-8
# frozen_string_literal: true

require 'nrser/notify'
require 'nrser/log/plugins/notify'
NRSER::Log::Logger.plugin NRSER::Log::Plugins::Notify
