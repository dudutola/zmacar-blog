# zmacar website

## Setup Repo
1. `git clone <repo-link>`
2. `cd <repo-directory>`
3. `bundle install`
4. install libvips 
   1. `sudo apt-get update`
   2. `sudo apt-get install -y libvips`
5. `rails db:create db:migrate db:seed`
6. `rails s`