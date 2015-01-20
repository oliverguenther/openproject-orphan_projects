module OpenProject::OrphanProjects
  module Patches
    module DeleteUserJobPatch
      def self.included(base)
        base.class_eval do
          unloadable

          include InstanceMethods

          alias_method_chain :perform, :orphan_projects
        end
      end

      module InstanceMethods
        private

        def perform_with_orphan_projects
          remove_orphaned_projects

          # Delete the user
          perform_without_orphan_projects
        end

        def remove_orphaned_projects
          user.projects.each do |p|
            members = p.members

            # Only remove projects with one member
            next unless members.length == 1

            # that is the user itself
            next unless members.first.user_id == user.id

            destroy_orphan p
          end
        rescue => e
          Rails.logger.error("Couldn't remove projects from user #{user.login}: #{e}")
        end

        def destroy_orphan(p)
          Rails.logger.info("Removing orphaned project #{p.name} (##{p.id})")
          p.destroy
        end
      end
    end
  end
end

DeleteUserJob.send(:include, OpenProject::OrphanProjects::Patches::DeleteUserJobPatch)
