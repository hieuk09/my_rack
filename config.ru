# frozen_string_literal: true

MyApp = lambda do |env|
  if env['PATH_INFO'] == '/hello'
    [200, {}, ['Hello, World!']]
  else
    [404, {}, ['Not Found']]
  end
end

run MyApp
