module OpenProject::OrphanProjects
  class Engine < ::Rails::Engine
    engine_name :openproject_orphan_projects

    include OpenProject::Plugins::ActsAsOpEngine

    register(
      'openproject-orphan_projects',
      author_url: 'https://github.com/oliverguenther/openproject-orphan_projects',
      requires_openproject: '>= 4.0.0'
    )

    patches [:DeleteUserJob]
  end
end
