# frozen_string_literal: true
require 'rails_helper'

RSpec.describe JobPostsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/job_posts').to route_to('job_posts#index')
    end

    it 'routes to #hourly' do
      expect(get: '/hourly').to route_to('job_posts#hourly')
    end
  end
end
