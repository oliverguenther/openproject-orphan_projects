require 'spec_helper'

describe DeleteUserJob do
  let(:job) { DeleteUserJob.new(user) }

  let(:user) { FactoryGirl.build_stubbed(:user) }
  let(:project) { FactoryGirl.build_stubbed(:project) }
  let(:members) {
    [FactoryGirl.build_stubbed(:member, user: user, project: project)]
  }

  before do
    allow(user).to receive(:projects).and_return([project])
    allow(job).to receive(:perform_without_orphan_projects).and_return(nil)
    allow(job).to receive(:user).and_return(user)
    allow(project).to receive(:members).and_return(members)
  end

  describe 'project' do
    context 'with user as only member' do
      it 'is removed' do
        expect(job).to receive(:destroy_orphan).with(project)
        expect(project.members.length).to be(1)

        job.perform
      end
    end

    context 'with multiple members' do
      let(:other_user) { FactoryGirl.build_stubbed(:user) }
      let(:members) {
        [
          FactoryGirl.build(:member, user: user, project: project),
          FactoryGirl.build(:member, user: other_user, project: project)
        ]
      }

      it 'is not removed' do
        expect(project.members.length).to be(2)
        expect(project).to_not receive(:destroy)

        job.perform
      end
    end
  end
end
