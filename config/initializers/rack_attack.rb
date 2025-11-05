# config/initializers/rack_attack.rb
class Rack::Attack
  ### Configure Cache ###
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  ### Throttle Requests ###
  
  # Throttle all requests by IP (60rpm)
  throttle('req/ip', limit: 300, period: 5.minutes) do |req|
    req.ip unless req.path.start_with?('/assets')
  end

  # Throttle POST requests to /subscriptions by IP address
  throttle('subscriptions/ip', limit: 5, period: 20.minutes) do |req|
    if req.path == '/subscriptions' && req.post?
      req.ip
    end
  end

  # Throttle POST requests to /contacts by IP address (prevent spam)
  throttle('contacts/ip', limit: 3, period: 30.minutes) do |req|
    if req.path == '/contacts' && req.post?
      req.ip
    end
  end

  # Throttle admin login attempts by IP address
  throttle('admin/login/ip', limit: 5, period: 20.minutes) do |req|
    if req.path == '/admins/sign_in' && req.post?
      req.ip
    end
  end

  # Throttle admin login attempts by email
  throttle('admin/login/email', limit: 5, period: 20.minutes) do |req|
    if req.path == '/admins/sign_in' && req.post?
      req.params['admin']['email'].to_s.downcase.gsub(/\s+/, "").presence
    end
  end

  ### Custom Throttle Response ###
  self.throttled_response = lambda do |env|
    retry_after = (env['rack.attack.match_data'] || {})[:period]
    [
      429,
      {
        'Content-Type' => 'text/html',
        'Retry-After' => retry_after.to_s
      },
      ["<html><body><h1>Too Many Requests</h1><p>Please try again in #{retry_after} seconds.</p></body></html>"]
    ]
  end

  ### Allow localhost in development ###
  safelist('allow-localhost') do |req|
    '127.0.0.1' == req.ip || '::1' == req.ip
  end

  ### Blocklist ###
  # Block suspicious requests
  blocklist('block suspicious requests') do |req|
    # Block requests with suspicious paths
    Rack::Attack::Allow2Ban.filter(req.ip, maxretry: 2, findtime: 10.minutes, bantime: 1.hour) do
      suspicious_path = req.path.include?('/wp-admin') ||
                       req.path.include?('/.env') ||
                       req.path.include?('/phpmyadmin') ||
                       req.path.include?('/.git')
      suspicious_path
    end
  end
end
