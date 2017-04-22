require "rails_helper"


RSpec.describe ActivateBotController, :type => :controller do

  let!(:bot) { create(:bot) }
  let!(:user) { create(:user) }
  let!(:task) { create(:task) }
  let!(:message_group) { create(:message_group) }
  let!(:key_word) { create(:key_word) }
  context 'for activate' do
    it 'should redirect to curent_user if bot id not found' do
      session[:user_id] = user.id
      get :activate
      expect(response).to redirect_to(user_path(user.id))
      expect(flash[:notice]).to eq(I18n.t("bots.params error"))
    end

    it 'should redirect to curent_user if message group not found' do
      session[:user_id] = user.id
      task.bots << bot
      get :activate, bot_id: bot.id
      expect(response).to redirect_to(user_path(user.id))
      expect(flash[:notice]).to eq(I18n.t('enter group for messages'))
    end

    it 'should redirect to curent_user if any key word not found' do
      session[:user_id] = user.id
      task.bots << bot
      task.message_group = message_group
      get :activate, bot_id: bot.id
      expect(response).to redirect_to(user_path(user.id))
      expect(flash[:notice]).to eq(I18n.t('enter key words'))
    end
  end

  context 'should do request' do
    it 'should get error' do
      session[:user_id] = user.id
      task.bots << bot
      task.message_group = message_group
      message_group.key_words << key_word
      get :activate, bot_id: bot.id
      expect(response).to redirect_to(user_path(user.id))
      expect(flash[:notice]).to eq(I18n.t("bots.access token error"))
    end

    # it 'should get success response from vk' do
    #   session[:user_id] = user.id
    #   task.bots << bot
    #   task.message_group = message_group
    #   message_group.key_words << key_word
    #   dbl = ActivateBotController.stub(:check_token) { 'this is the value to return' }
    #   get :activate, bot_id: bot.id
      # parsed_response = JSON.parse(response.body)
      # parsed_response = JSON.parse(response.body)
      # expect(parsed_response['error']).to eq("Student does not exist")
      # dbl = double("Some Collaborator")
      # expect(dbl).to receive(:foo)
      # expect(assigns(:bot_piar_groups)).to eq(0)
      # expect(response).to redirect_to(user_path(user.id))
      # expect(flash[:notice]).to eq(I18n.t("bots.access token error"))
    # end
  end
end