require 'json'
require 'byebug'
class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    # debugger
    if req.cookies["_rails_lite_app"]
      # debugger
        @cookies = JSON.parse(req.cookies["_rails_lite_app"]) #deserializes string into a hash
    else #cookies is now deserialized value, which is just a ruby-object hash
      @cookies = {}
    end
  end

  def [](key)
    @cookies[key]
  end

  def []=(key, val)
    @cookies[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie("_rails_lite_app", {path: "/", value: @cookies.to_json })
  end
end
