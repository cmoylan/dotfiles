function dip:restart
  dip down && docker volume rm printavo_code && dip up web -d
end
