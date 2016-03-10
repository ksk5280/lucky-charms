# Lucky Charms!
![alt text](https://lh3.googleusercontent.com/-zAfzSjPn97Y/VuGzalr5HYI/AAAAAAAAC84/Euuhylif5zw/s638-Ic42/Screen%252520Shot%2525202016-03-10%252520at%25252010.16.16%252520AM.png "Lucky Charms")

Merge conflicts got you down? Stack level too deep? Rainbow wheel of doom? Sounds like you're on a run of bad luck. Fortunately, at Lucky Charms, we can help!

We've got lucky charms for whatever you may need. From a little boost to help you get in and out of Starbucks faster, to a big dose that will make you a superstar for an hour or two, we've got it all. Checkout the lucky clothes for those socks that will guarantee* your team to win. Grab a potion to get lucky in love. And even check the weather in your area to see if you've got a rainbow in the forecast!


## The project
![alt text](https://lh3.googleusercontent.com/-E3JGWuYBILA/VuGza5HlblI/AAAAAAAAC9I/-j3krOmogRE/s912-Ic42/Screen%252520Shot%2525202016-03-10%252520at%25252010.16.29%252520AM.png "They'll magically make you lucky!")

This project is our implementation of the Module 2 "Little Shop" final project. Our group was: Kimi (@kskano528), Erinna (@erinnachen), Brennan (@brennanholtzclaw).
We've built a Ruby on Rails e-commerce store from the ground up. We decided to do a store that we could have a little fun with while learning the ins and outs of what tools Rails has to offer.

Using feature and model tests written in RSpec we were able to drive development from a TDD standpoint and make sure that what we happy and sad paths were covered at each turn. CSS styling lends the site a fun facade, and some extra implementation of javascript and jQuery makes it interactive in fun ways.


## The implementation

This project started out with a lot of group pairing while we all got on the same page about the direction we wanted to go. We came together to write feature tests and decide how we wanted the site to look and what our expectations were for the code and the process of building the project. We developed a 25 step workflow during this time. That seems excessive, but it meant that we didn't have any major merge conflicts, and we all knew what was expected at each stage of development. That made dividing-and-conquering work a much more stress free process.


![alt text](https://lh3.googleusercontent.com/-AZOQnFlQdMs/VuGzbVVZLXI/AAAAAAAAC9I/nUNteLz58Dc/s640-Ic42/Screen%252520Shot%2525202016-03-10%252520at%25252010.17.21%252520AM.png "Edit your cart information")

In our store a user can now register, sign-in, add items to their cart, edit the quantity of those items, and checkout. The user can also edit basic profile information after signing up.
An Admin user has even more privileges. An Admin is able to edit orders that have been placed to change their status, and to create new items. Admins are also able to retire items, just in case we sell out of our Four-Leaf Clovers.
The project is pushed to Heroku at : http://polar-reef-22111.herokuapp.com/

#### Extra-Bits

![alt text](https://lh3.googleusercontent.com/-WLW_ZDPvKvA/VuGzbzcweUI/AAAAAAAAC9I/LqXLuspmB78/s912-Ic42/Screen%252520Shot%2525202016-03-10%252520at%25252010.17.55%252520AM.png "Maybe we'll just put those back...")

For easier implementation of some pieces, and for help with some extensions (listed below), we employed the user of a few fun gems and an API. The Paperclip gem let's the Admin upload image files for new items, a call to the Open Weather API provides forecast details for your town, the ______ gem lets us e-mail our user order confirmations, and the Factory Girl gem makes our testing lives terrible and wonderful at every turn.

## Extensions

![alt text](https://lh3.googleusercontent.com/-4Qran4LP5Fo/VuGzaLLKP_I/AAAAAAAAC80/RziwROwibQ4/s912-Ic42/Screen%252520Shot%2525202016-03-10%252520at%2525209.46.29%252520AM.jpg "What's the weather like?")

Beyond the basic functionality of an e-commerce store, we challenged ourselves to finish a few extra pieces. Users are able to check the weather in their city. If rain is in the forecast, you'll have a special opportunity to get that pot of gold at the end of the rainbow. The forecast page also has a little bit of jQuery magic to make the dynamic icons grow and shrink as you hover over them. Also, When users register an account at Lucky Charms, they can provide an email address. If they do, they'll get an e-mail after an order is places to confirm a few details.
