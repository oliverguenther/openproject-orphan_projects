# encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)

require 'open_project/orphan_projects/version'
Gem::Specification.new do |s|
  s.name        = 'openproject-orphan_projects'
  s.version     = OpenProject::OrphanProjects::VERSION
  s.authors     = ['Oliver Günther']
  s.email       = 'mail@oliverguenther.de'
  s.homepage    = 'https://www.github.com/oliverguenther/openproject-orphan_projects'
  s.summary     = 'Remove Orphans'
  s.description = 'This plugin deletes orphaned projects after their project owner has been deleted.'
  s.license     = 'MIT'

  s.files = Dir['{lib}/**/*'] + %w(README.md)
end
