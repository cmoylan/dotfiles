function vpn
  if test $argv = 'u'
    nordvpn connect
  else if test $argv = 'd'
    nordvpn disconnect
  else
    nordvpn disconnect
    nordvpn connect
  end
end
