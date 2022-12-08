# Brandeis Class Hub

### Project Name, Team Name/Number and Team Members
- Project Team: Brandeis Class Hub
- Team Name: Team Three
- Team Number: 3
- Team Members: Jason Gordon, Lu Hao, Jiefang Li, David Shapiro

### Summary of functionality
Generally, our functionality so far is making events for the calendar, sharing calendars, and switching views/months. Most of our calendar and shared calendar functionality is up, and you can schedule and create events accordingly. You can share these calendars via link and have other people see them as well.

### Trello Link
https://trello.com/b/heBEa0Pv/main

### Heroku Link
https://rocky-hollows-83897.herokuapp.com/

### URL patterns
**Root (/):** This shows the landing page of the app, it introduces the concept of the app and has a carousel showing main functionalities.
**Calendar View (/home/calendar):** This is the main page of the app, where users see all their events showing one a calendar.
**Search (/search):** This page shows the search result of calendars. 
**Subscribe (/subscribe):** This page is where users have options to subscribe to more calendars.
**Events table (/total_events):** This refers to a list of events this user has.

**Calendar Routes:**
- Route: */calendars* - /calendars refers to a list of calendars this user has.
- Methods: *#index*, *#create*
  - #index shows the calendars.
  - #create allows the user to create a new calendar; it renders /new.
- Sub-routes on /calendar: */new*, */:index* 
  - /:invite_token refers to the specific calendar.
  - Methods on /:invite_token - *#show*, *#update*, *#destroy*
    - #show shows the current calendar.
    - #update updates the current calendar.
    - #destroy deletes the current calendar.
  - Sub-route on /:invite_token - /edit, which changes the settings on the current calendar.

**UserCalendar Routes:**
- Route: */user_calendars* - /calendars refers to a list of calendars with users.
- Methods: *#index*, *#create*, *#subscribe*
  - #index shows the user calendars.
  - #create allows the user to create a new user calendar;
  - #subscribe allows the user to subscribe to another calendar in the database; it renders /subscribe_calendar
- Sub-routes on /user_calendars: */new*, */:index* 
  - /:id refers to the specific calendar.
  - Methods on /:id - *#show*, *#update*, *#destroy*
    - #show shows the current user calendar.
    - #update updates the current user calendar.
    - #destroy deletes the current user calendar.
  - Sub-route on /:id - /edit, which changes the settings on the current user calendar.
  
**Event Routes**
- Routes: */events*, */holidays*, */class_periods*, */courses*, */assignments*
  - All of these have the same methods, but are different types of event.
- Methods on these routes: *#new*
  - #new makes a new event of the specified type, it renders /new.

- Routes: */calendars/:calendar_invite_token/other_events*, */calendars/:calendar_invite_token/holidays*, */calendars/:calendar_invite_token/class_periods*, */calendars/:calendar_invite_token/courses*, */assignments*
- Sub-routes for these routes: */:slug*
  - /:slug refers to the specific event.
  - Method on /:slug - *#show*, *#update*, *#destroy*
    - #show shows the specific event.
    - #update updates the specific event.
    - #destroy deletes the specific event.
  - Sub-route on /:slug - */edit*: This allows a user to edit the event.
  
**Sign-up/Login Routes**
- Routes: */users*, */signup*, */login*, */logout*
    - /signup creates a new User and allows a user to sign up for the service. It uses the method users#new.
    - /login creates a new session and logs in the user. It uses sessions#new and sessions#create to do this.
    - /logout closes the session and logs out the user via sessions#destroy.
    - /users refers to all of the users.
      - Sub-route on /users: */:id*, which refers to a single user.
        - Methods on /:id - *#show*, *#update*
          - #show displays the user
          - #update updates the user via /edit.
        - Sub-route on /:id - */edit*, which is a page that updates the user.



### Schema
<img width="1156" alt="image" src="https://user-images.githubusercontent.com/88059544/206369199-2d2fa442-815d-4a43-a7bc-3f5247e51ace.png">

### Views
- Landing page to introduce the app.
- Sign up page and login page for users. 
- Calendar home view where users can switch between days, weeks and months and view all events.
- Shared calendar view where users can create a calendar, edit a shared calendar, either shared or not.
- Event view is built on calendar view, where users can create an event on a calendar. Based on the event category, assignment view, holiday view and other events view loads where users can put in detailed information for each event.
- Calendar list view where users can see all the calendars they created and subscribed to.
- Event list view where users can see all the events they have in a list.
- Subscribe form view where users can search for more calendars to subscribe.
- Search view where users can view the search result of calendars in a list. 

### List of our dependencies on APIs, gems, libraries and so on
- gem 'rails', '~> 7.0.4'
- gem 'bootstrap-sass', '3.4.1'
- gem 'sprockets-rails'
- gem 'pg', '~> 1.1'
- gem 'puma', '~> 5.0'
- gem 'importmap-rails'
- gem 'turbo-rails'
- gem 'stimulus-rails'
- gem 'devise_invitable', '~> 2.0.0'
- gem 'jbuilder'
- gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
- gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
- gem 'bootsnap', require: false
- gem 'bootstrap-sass', '3.4.1'
- gem 'debug', platforms: %i[mri mingw x64_mingw]
- gem 'web-console'
- gem 'capybara'
- gem 'selenium-webdriver'
- gem 'webdrivers'

### Instruction to run test
```
rails test
rails test:system test
```

### Screenshots as of Dec 8
<img src="./app/assets/images/paper_prototype/Landing_Page.png">
<img src="./app/assets/images/paper_prototype/Calendar_View.png">
<img src="./app/assets/images/paper_prototype/New_Course_Form.png">
<img src="./app/assets/images/paper_prototype/Profile.png">
<img src="./app/assets/images/paper_prototype/Calendar_List.png">
<img src="./app/assets/images/paper_prototype/Course_Info.png">
<img src="./app/assets/images/paper_prototype/Repeated_Events.png">





