Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '599001626780934', '410c3a2050ebb0abc0be0cdbdf2f7b17'
end