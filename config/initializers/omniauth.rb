Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1385008185085963", "8facf154fd92fa08a70a0bb35f20de14"
  # :redirect_uri => 'http://localhost:3000/auth/facebook',
  # display: 'popup'
end