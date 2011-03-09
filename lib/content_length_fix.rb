module Nginx
  class ContentLengthFix
    def initialize(app)
      @app = app       
    end                

    def call(env)      
      # get details of request
      status, headers, response = @app.call(env)
      
      # fix missing content length
      if status == 201
        headers["Content-Length"] = response.length.to_s
      end
      
      # return response
      [status, headers, response]
    end                
  end
end