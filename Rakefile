require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/apphoshies_client'

Hoe.plugin :newgem

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'apphoshies_client' do
  self.developer 'Oliver Kiessler', 'kiessler@inceedo.com'
  self.post_install_message = 'PostInstall.txt'
  self.rubyforge_name       = self.name
  self.extra_deps         = [['activeresource','>= 2.3.5']]
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }
