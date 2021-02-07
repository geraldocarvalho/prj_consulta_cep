# frozen_string_literal: true

require 'rspec'
require 'httparty'
require 'pry'
require 'yaml'

require_relative '../services/viacep_service'

API_DATA_LOAD = YAML.load_file("#{File.dirname(__FILE__)}/config/default_data.yaml")
