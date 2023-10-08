sudo docker build -t tor-proxy tor/
sudo docker run -d -p 9050:9050 --name tor-proxy-container tor-proxy
