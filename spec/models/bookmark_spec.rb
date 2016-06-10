require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"


  describe "Bookmark user" do

    let(:user) {FactoryGirl.create(:user)}

    # it { user.should be_kind_of Bookmark }

    describe "watch a todo" do

      context "when todo is public" do

        let(:todo) { FactoryGirl.create(:todo, :public => true) }

        it "can creates a bookmark relationship with todo" do

          lambda {
            FactoryGirl.create(:bookmark, :todo => todo)
          }.should change(user.bookmarks, :count).by(1)

          user.bookmark?(todo).should be_true
        end
      end
    end

    describe "unwatch a todo" do

      context "when user is favorite a todo" do

        let(:todo) {FactoryGirl.create(:todo)}

        before do
          FactoryGirl.create(:bookmark, :user_id => user, :todo => todo)
        end

        it "can remove a favorite relationship with todo" do
          ##########
        end

      end

    end

  end
end