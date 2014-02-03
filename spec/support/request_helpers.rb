module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end
  end

  module UsersHelpers
    def login user
      user = { email: user.email, password: 'password'}
      post user_session_path, user: user
    end
  end
end
