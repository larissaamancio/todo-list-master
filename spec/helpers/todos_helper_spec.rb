require 'rails_helper'

RSpec.describe TodosHelper, type: :helper do

  describe TodosHelper do

    let(:current_user) { FactoryGirl.create(:user) }
    let(:todo) { FactoryGirl.create(:todo) }

    before { helper.stub :current_user => current_user }

    describe "#visibility(todo)" do

      subject { helper.visibility(todo) }

      context "when todo is public" do

        before { todo.stub(:public? => true) }

        it { should eq "public" }

      end

      context "when todo is not public" do

        before { todo.stub(:public? => false) }

        it { should eq "private" }

      end

    end
  end
end