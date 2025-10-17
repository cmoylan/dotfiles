function pspc -d "product service prod console"
  heroku run "rails console -- --noautocomplete" -a inktavo-product-service
end
