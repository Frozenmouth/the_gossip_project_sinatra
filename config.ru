#Takes in consideration everything stocked in the lib folder
$:.unshift File.expand_path("./../lib", __FILE__)

require 'controller'
run ApplicationController
