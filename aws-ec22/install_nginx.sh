#!/bin/bash

sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1>Welcome to Nginx Page</h1>" | sudo tee /var/www/html/index.html