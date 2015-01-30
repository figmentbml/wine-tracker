[![Build Status](https://travis-ci.org/figmentbml/wine-tracker.svg?branch=master)](https://travis-ci.org/figmentbml/wine-tracker)

[![Code Climate](https://codeclimate.com/github/figmentbml/wine-tracker/badges/gpa.svg)](https://codeclimate.com/github/figmentbml/wine-tracker)

production url: www.wine-tracker.co

Features:
- Users can register/sign in/sign out
- Users can add wine
- Users can browse Colorado wineries and their info
- Users can learn about how to taste wine
- Offer users an advanced user option to have a lot of tasting notes
- Users can rate wine and input basic tasting notes

Setup:
- clone
- rake db:create
- rake db:migrate
- rake db:seed
- bundle
- You will need Amazon S3 and Yelp API keys in order to run it locally
