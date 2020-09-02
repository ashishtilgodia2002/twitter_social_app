## Getting Started
#
1. Install ruby version `2.7.0`.
2. Install `mysql`.
3. Configure mysql in `/config/database.yml`. Default setting: `host`: `127.0.0.1`, `port`: `3306`, `username`: `root`, `password`: ``. 
4. Run `gem install bundler`.
5. Run `bundle install`.
6. Run `bundle exec rake db:create`.
7. Run `bundle exec rake db:migrate`.  
8. Run `foreman start`.  
9. Open `http://localhost:9007/`.
