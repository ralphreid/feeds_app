CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV["FEEDX_AWSAccessKeyId=AKIAIOE5S7HXG5RUPZWQ"],                        # required
    :aws_secret_access_key  => ENV["FEEDX_AWSSecretKey=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"],                        # required
    :region                 => 'eu-west-1'               # optional, defaults to 'us-east-1'
    # :host                   => 's3.example.com',             # optional, defaults to nil
    # :endpoint               => 'https://s3.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = ENV['FEEDX_BUCKET']                    # required
  config.fog_public     = true                                  # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end