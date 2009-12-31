# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'hoe/signing'
require './tasks/spec.rb'
require './tasks/yard.rb'

Hoe.spec('ffi-bert')do
  self.developer('Postmodern', 'postmodern.mod3@gmail.com')

  self.readme_file = 'README.rdoc'
  self.history_file = 'History.rdoc'

  self.extra_deps = [
    ['ffi', '>=0.6.0']
  ]

  self.extra_dev_deps = [
    ['rspec', '>=1.2.9'],
    ['yard', '>=0.5.2']
  ]

  self.spec_extras = {:has_rdoc => 'yard'}
end

# vim: syntax=ruby