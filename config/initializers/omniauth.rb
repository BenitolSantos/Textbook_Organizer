Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, Rails.application.credentials.facebook[:facebook_key], Rails.application.credentials.facebook[:facebook_secret]
end
#dustin approved way^

#EDITOR=nano rails credentials:edit 
#typing in terminal this makes this encrypted and also makes you able to use the key.
#exit with ctl x y then enter
#remember to use the master.key in config file!
#don't push with master.key remember to move to desktop after each use.


#The master key is now needed when using the app to hide the key and secret