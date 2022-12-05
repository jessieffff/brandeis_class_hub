# CS166 Final Project Report - Brandeis Class Hub
Lu Hao, David Shapiro, Jiefang Li, Jason Gordon

Brandeis Class Hub is an organizational system for Brandeis students to handle their classes, from a system of shared calendars to easily view class times and share club times to a personal calendar with assignments and general tasks to do.
Our group took this challenge and used it as a way to not only develop a working app, but also challenge our current abilities and grow from that. Naturally, we were met with a few challenges along the way. 

### Log in/sign-up
One of the first challenges we encountered was how to manage logins. Originally, we used the user models and log-in from the [Ruby on Rails Tutorial](https://www.learnenough.com/course/ruby_on_rails_tutorial_7th_edition/modeling_users), taking advantage of our resources to make a working Users and Sessions model. Here, we encountered some issues, notably how to incorporate this Users model into an already developed Schema. This caused issues with names and attributes, which we then ironed out.

Finding that this was not secure and easy enough for our liking, we also decided to add a Google Login to enable users to log into their accounts using their Google emails. Since our application is designed primarily for Brandeis students, a Brandeis login would ensure information would only be shared between students, and a Google login accomplishes much the same goal. To do this, we installed the `omniauth-google-auth-2` gem and incorporated it with the existing users system. The largest challenge was to find the correct gem; while some gems were helpful, many required a large amount of change to our code base. However, we were able to find the best gen for our needs, and if given more time, it would be useful to ensure only a Brandeis email address can be used to log in, and have the application send a verification email to users.

### Importing Events and Setting up the Calendars
Next, a user should be able to import events and create their own events, having them recur as needed. Here, we also made a few choices in implementation, and found challenges as well.
Workday allows course schedules to be exported to Excel, whose files can easily be parsed into our system. Because of this, recurrent class periods are automatically generated from the Workday file and will show up in the calendar. We did this because manually adding courses is time-consuming and allows for a large number of errors, and importing an excel file both ensures accuracy and reduces time spent making courses.

To make the Excel files upload properly, we installed the `roo` and `roo-xls` gems to enable the user to pick a local file and allow our application to extract the information properly. Due to the discrepancy  between our initial schema design and the file’s information, we translated the original data to align with the design. After that, we used helper functions to create recurring classes after each new course was created. Given more time, we would expand the support of  the import functionality to include `.ical` files, for instance.

You can, of course, manually create events in our application. Here, we also encountered a few difficulties.
If someone creates a course, for instance, we need to generate class periods with specific event objects for each day of the class. To ensure we could do this, we wrote an algorithm to find the first days of class for each day of the week it meets, and repeated the pattern every week until the end date was reached.

Moreover, people may want to find a date far into the future or the past. Originally, the user had to go month by month, which is time consuming and illogical. So, we added a date picker that utilized the URL format we have to take users to the specific date.

### Shared Calendars
Possibly one of the most unique parts of our application was to include the ability to share calendars between users. This ensures people do not repeat calendars and can simply say they want the events of someone else’s calendar — for example, a club or a class.

To find these calendars, users can both search for calendars and share calendars using a token. Users can search by a keyword in our application, and the corresponding calendars will show up. Moreover, each calendar is generated with an encrypted link, and the users can share the link with anyone to view the same calendar. This is incredibly beneficial for things like clubs, when users need to coordinate and plan events. Here, we encountered some difficulty generating the token, and ensuring that the app would understand that that token adds a user and a calendar match to the shared user-calendar table.

Links are not the only way someone can have a shared calendar; public shared calendars also exist in Brandeis Class Hub, and users can subscribe and unsubscribe from these calendars. One of the best ways this can be used is to allow for class periods to be shared from professors to students without the complication of sending a specific token; Users can simply search for a class and they will find it if the professor has created it. A challenge here was to figure out how to create a record in the bridge table for users and calendars.

Given more time, some ideas to increase the interactiveness of shared calendars would be to allow for more connection to the University Registrar to obtain the courses needed for the semester and automatically create all courses offered for the semester, allowing users to subscribe to them right away.

### Viewing Calendars and Events
One of the things intrinsic to an application that is based around calendars is viewing the calendar and events. It is vital that this is implemented properly so the app can function properly. However, there were challenges in making this view up to the standard we wanted.

First, we made a list of calendars and events so users can view the calendars and events that they subscribed to in one condensed place. This makes it easier to navigate through all information, allowing the user to know what calendars they have and what events are coming up. A challenge here was finding all the events and calendars a user created or subscribed to, which we used our linked database relationships to solve.

Simple lists of calendars and events was not the only thing we wanted, though. It was of immense importance for us to have a calendar that was a calendar in the traditional sense, and display the events accordingly. The challenge here was twofold: first, how do we make a calendar properly, and second, how can we simplify or generalize the view?

Calendars are complicated, as the way the year is structured is varied and has exceptions. For instance, leap years are every four years, but not on years divisible by 100, but also on years divisible by 400. Moreover, months simply start on different days depending on the month and the year, and months are not the same length year-wide, with some having 30, some having 31, and February having 28 or 29. We solved this by building our months, weeks, and days using the built-in Date class, utilizing the class to find the number of days in the first and last week, with the middle always being seven.

We also wanted to split up the view into a Day, Week, and Month view. This allows users to see their calendar in a more concentrated view on a single day, or a more generalized view for a whole month. This was challenging to create because the HTTP protocol is stateless. So, we added a URL parameter for the date, and nested the views, so the day view was inside the week view, which in turn was inside the month view.

Given more time, it would be useful to have weeks span multiple months, and to incorporate other views if possible.

### URLs
Finally, we discussed exactly how we wanted the URL to look, whether it be a simple iterated URL like `https://rocky-hollows-83897.herokuapp.com/events/1` or a more complex URL like `https://rocky-hollows-83897.herokuapp.com/calendars/[:ENCRYPTED_CALENDAR_TOKEN]/events/[:event_name]`. We decided to go with the latter URL design on events and calendars to ensure data protection. With an insecure URL like `events/1`, data can be accessed randomly and can be changed by a malicious user. With the encrypted design, it is much safer.

A challenge here was how to design a URL pattern that is difficult to decode but also provides relevant information. So, we combined the calendar’s token with the event name to solve this disparity.

### Conclusion
Brandeis Class Hub is the culmination of three months of hard work by our team, but there is always more to do. There is always more to add and more to develop if given more time. For instance, we can always upgrade our UI to make it look neater, and add functionality to make it more Brandeis-centric. Moreover, we can add an easier way to view tasks on a To-Do list of sorts and add Email alerts for new events and when assignments are due. There is always more we can do, especially with the solid framework we have made.
