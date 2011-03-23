bash "install_libspotify" do
  user "deploy"
  cwd "/tmp"
  code <<-EOC
    wget http://developer.spotify.com/download/libspotify/libspotify-0.0.6-linux6-i686.tar.gz
    tar xzf libspotify-0.0.6-linux6-i686.tar.gz && cd libspotify-0.0.6-linux6-i686
    sudo make prefix=/usr install 
    rm -rf /tmp/libspotify-0.0.6-linux6-i686*
  EOC
end