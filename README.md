# README

### This is a website for Rockaway Ice Lady, an Italian Ice Cart business.  Currently the website allows users to-
* Subscribe and Unsubscribe to mailing list
* Receive SMS messages
* Locate cart locations
* Vote for the Favorite Flavor Friday ice
* See real-time information about votes
* Request to Book an Event
* Send Event Requests to Business
* Weekly Task to Reset Survey Count and Send Vote Information to Business

Software Versions-
* Ruby 2.4.0
* Rails 5.1.1

System dependencies-
* Ruby on Rails
* Twilio API via gem "Twilio-Ruby"
* SendGrid API via gem "sendgrid-ruby"
* Charts.js API
* Google Maps API
* Whenever gem
* JSON
* JavaScript
* jQuery
* SQL
* Materialize
* Animate.CSS
* Google Fonts
* Font Awesome

Configuration-
* Materialize locally installed
* Animate.CSS CDN
* API Charts.js using CDN
* Development
** SQLite3
** Using Whenever gem for Weekly Rake Task
* Production
** PostgreSQL
** Using Heroku Scheduler for Weekly Rake Task

Database initialization-
Locations and Flavors db's 
* rails db:seed

#### Code for Generating Colors in Flavors List
In controller-

![image](https://cloud.githubusercontent.com/assets/26287145/26642823/38155e32-45fd-11e7-9909-0c0dcd6b64fa.png)


![image](https://cloud.githubusercontent.com/assets/26287145/26642082/81ffda20-45fa-11e7-8377-f66575bf04d5.png)

####  Code for Assigning Unsubscribe Code

Since users are not creating accounts in system, a random generated 6-digit code is created at time of subscribing.  This code is listed in all email communications for use when user wants to unsubscribe to Mailing List-

![subscribe2](https://user-images.githubusercontent.com/26287145/27047015-8f5fd00c-4f74-11e7-9b22-2ae6da4d4b02.png)

####  Code and Behind Scenes Look at Unsubscribing

First screenshot shows how the unsubscribe code is verified -

![unsubscribe](https://user-images.githubusercontent.com/26287145/27047022-99369fe8-4f74-11e7-8e59-e7228a82032f.png)

Next screenshot show how rescue is handle should user try using unsubscribe link after their account has been totally deleted-

![unsubscribe2](https://user-images.githubusercontent.com/26287145/27047020-957b1672-4f74-11e7-85ec-63bba7328c6e.png)


### Roadmap-
Create Admin Portal to allow owner of company to-
* Manipulate Locations and Flavors databases
* Create mailers and SMS via templates
* Post current cart location without use of Location Services
