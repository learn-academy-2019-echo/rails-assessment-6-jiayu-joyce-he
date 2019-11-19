# ASSESSMENT 5: INTRO TO RAILS
## Interview Practice Questions

Answer the following questions. First, without external resources. Challenge yourself to answer from memory. Then, research the question to expand on your answer. Even if you feel you have answered the question completely on your own there is always something more to learn.

1. MVC (Model View Controller) is a pattern for the architecture of a software program. Give a brief description of each component and describe how Ruby on Rails handles MVC.

  ### Your answer:

  Model:
  Model defines the business logic of application, for example what data to collect, and how they are going to be used.
  In rails, we need to create a model to define the attributes of the database.

  View: View creates the interface of what users see.

  Controller: Controller defines what interactions will happen based on users interactions. It retrieve relevant data from the database and make them available for rendering user view.

  ### Researched answer:
  Model View Controller is a design pattern and a popular way of organizing code, where sections have their unique purposes, and were stored separately. The idea is that there should be separation of concerns. In Ruby on Rails, we have different folders for model, controller and view.

  Model codes reflects the business logic of your app, meaning it's part of the program that "encodes the real-world business rules that determine how data can be created, stored, and changed." The code can hold real data or define essential components of the app.

  Model maintains the relationship between Object and Database and handles validation, association, transactions. Each model (can) represent a database table (in case of SQL databases). This model object gains capabilities (inherited from ActiveRecord — Rails class) to retrieve, save, edit, and delete data from database table. We use model objects as a layer between our application and the database. Besides that relation with the database, the model can create validations and associations between models.

  Models in Rails use a singular name, and their corresponding database tables use a plural name.

    The Model:
    - Contains data for the application (often linked to a database)
    - Contains state of the application (e.g. what orders a customer has)
    - Contains all business logic
    - Notifies the View of state changes (** not true of ROR, see below)
    - No knowledge of user interfaces, so it can be reused

  View: codes define how your users will see and interact with the app. The views is a presentation of data in a particular format, triggered by a controller’s decision to present the data. For most pages on the web, the views will be an HTML styled with CSS and JS. It purpose is to display this information in a human readable format. By default, view templates are written in a language called eRuby (Embedded Ruby) which is processed by the request cycle in Rails before being sent to the user.

    The view:
    - Generates the user interface which presents data to the user
    - is Passive, i.e. doesn’t do any processing
    - Views work is done once the data is displayed to the user.
    - Many views can access the same model for different reasons

  Controller: ties the model and the view together. It receives user input and deciding what to do with it. It is the the facility within the application that directs traffic, on the one hand querying the models for specific data, and on the other hand organizing that data (searching, sorting) into a form that fits the needs of a given view. It takes care of the flow: uses models to do queries, parses data, make decisions in which format you’ll present the data.

    The controller:
    - Receive events from the outside world (usually through views)
    - Interact with the model
    - Displays the appropriate view to the user

Putting together:

![Rails architecture](https://miro.medium.com/max/1832/1*KK61kGXrkaFBDfY7uWukyQ.png)
(Retrieved from: https://medium.com/the-renaissance-developer/ruby-on-rails-http-mvc-and-routes-f02215a46a84)

  When interacting with our application, a browser sends a request, which is received by a web server and passed on to the Rails routing engine. The router receives the request and redirects to the appropriate controller class method based on the routing URL pattern. (Basic Rails routing is relying on controller and its actions. In other words, the Rails router recognizes URLs and dispatches them to a controller's action.)

  The controller then takes over. In some cases, the controller will immediately render a view for the browser. More commonly for dynamic sites, the controller interacts with a model.

  After invoking the model, the controller then renders the final view (HTML, CSS, and images) and returns the complete web page to the user's browser.

  In short, request first comes to the controller, controller finds and appropriate view and interacts with model, model interacts with your database and send the response to controller then controller based on the response give the output parameter to view.

  Rails has an application directory called app/ with three subdirectories: models, views, and controllers. This is the model-view-controller (MVC) architectural pattern, which enforces a separation between business logic from the input and presentation logic associated with a graphical user interface (GUI).

  In the case of web applications, the business logic typically consists of data models for things like users, articles, and products, and the GUI is just a web page in a web browser.

  References:
  - https://guides.rubyonrails.org/getting_started.html#creating-the-blog-application
  - https://www.codecademy.com/articles/mvc
  - https://stackoverflow.com/questions/1931335/what-is-mvc-in-ruby-on-rails
  - https://www.bogotobogo.com/RubyOnRails/RubyOnRails_Model_View_Controller_MVC.php
  - https://medium.com/the-renaissance-developer/ruby-on-rails-http-mvc-and-routes-f02215a46a84


2. Using the information given, fill in the blanks to complete the steps for creating a new view in a Rails application.

  Step 1: Create the __route & http request__ in the file config/routes.rb
  ```
  get '/about' => 'statics#about'
  ```

  Step 2: Create the ____action "about"____ in the file ____app/controllers/statics.rb____
  ```
  class ____Static____ < ApplicationController
    def ____about____
      render _____'about'______
    end
  end
  ```

  Step 3: Create the View in the file _____app/views/statics/about.html.erb_____
  code:
  ```
  <div>This is the About page!</div>
  ```


3a. Consider the Rails routes below. Describe the responsibility of each route.


/users/       method="GET"     # :controller => 'users', :action => 'index'

Index shows all the users.


/users/1      method="GET"     # :controller => 'users', :action => 'show'

Show shows individual user. In this case, the user with an id of 1.

/users/new    method="GET"     # :controller => 'users', :action => 'new'

New shows the users the page where they can create a new data entry. Data can be collected using a form.

/users/       method="POST"    # :controller => 'users', :action => 'create'

The #create will collect data from the form and insert that data entry to the database.

/users/1/edit method="GET"     # :controller => 'users', :action => 'edit'

The edit will show the user the interface where they can edit the data.

/users/1      method="PUT"     # :controller => 'users', :action => 'update'

The #update is the action that happens after users submit their edits, and it interact with the model to update the data entry.

/users/1      method="DELETE"  # :controller => 'users', :action => 'destroy'

The delete route will trigger the #destroy action that remove the data entry from the database.


3b. Which of the above routes must always be passed params and why?

Show, edit, update and delete. Because they action on specific data entry.


4. What is the public folder used for in Rails?

  Your answer:
  To store assets that can be rendered and shown directly without a database.

  Researched answer:
  In many MVC frameworks (e.g. Rails), the public folder is used to serve static files. The public directory contains some of the common files for web applications. By default, HTML templates for HTTP errors, such as 404, 422 and 500, are generated along with a favicon and a robots.txt file. Files that are inside this directory are available in https://appname.com/filename directly.

  References:
  - https://softwareengineering.stackexchange.com/questions/300701/what-is-the-role-of-the-public-folder-in-mvc-web-applications


5. Write a rails route for a controller called "main" and a page called "game" that takes in a parameter called "guess"

get '/main/page/guess'



6. In an html form, what does the "action" attribute tell you about the form? How do you designate the HTTP verb for the form?

  Your answer:

  The HTML | action Attribute is used to specify where the formdata is to be sent to the server after submission of the form.

  Researched answer:

  It is used to specify where the formdata is to be sent to the server after submission of the form.

  It can take in an
  - absolute URL, points to another web site (like action="http://www.example.com/example.htm")
  - or a relative URL - points to a file within a web site (like action="example.htm")


7. Name two rails generator commands and what files they create:

  Your answer:

  rails g model  
  rails g controller

  Researched answer:
  rails generate controller
  rails generate model


8. Rails has a great community and lots of free tutorials to help you learn. Choose one of these resources and look through the material for 10-15 min. List three new things you learned about Rails:
- [Ruby on Rails Tutorial](https://www.tutorialspoint.com/ruby-on-rails/index.htm)
- [Rails for Zombies](http://railsforzombies.org)
- [Rails Guides](http://guides.rubyonrails.org/getting_started.html)

1. For Embedded Ruby, if you want some Ruby code executed, enclose it between <% and %>. If you want the result of the code execution to be printed out, as a part of the output, enclose the code between <%= and %>.

2. Metaprogramming

Where other frameworks use extensive code generation from scratch, Rail framework uses Metaprogramming techniques to write programs. Ruby is one of the best languages for Metaprogramming, and Rails uses this capability well. Rails also uses code generation but relies much more on Metaprogramming for the heavy lifting.

3. Ajax stands for Asynchronous JavaScript and XML.

Rails has a simple, consistent model for how it implements Ajax operations. Once the browser has rendered and displayed the initial web page, different user actions cause it to display a new web page (like any traditional web application) or trigger an Ajax operation −

Some trigger fires − This trigger could be the user clicking on a button or link, the user making changes to the data on a form or in a field, or just a periodic trigger (based on a timer).

The web client calls the server − A JavaScript method, XMLHttpRequest, sends data associated with the trigger to an action handler on the server. The data might be the ID of a checkbox, the text in an entry field, or a whole form.

The server does processing − The server-side action handler ( Rails controller action )-- does something with the data and returns an HTML fragment to the web client.

The client receives the response − The client-side JavaScript, which Rails creates automatically, receives the HTML fragment and uses it to update a specified part of the current page's HTML, often the content of a <div> tag.

These steps are the simplest way to use Ajax in a Rails application, but with a little extra work, you can have the server return any kind of data in response to an Ajax request, and you can create custom JavaScript in the browser to perform more involved interactions.

9. STRETCH: What are cookies? What is the difference between a session and a cookie?

  Your answer:
  Information stored on the client side.

  Researched answer:

  A computer “cookie” is more formally known as an HTTP cookie, a web cookie, an Internet cookie or a browser cookie. The name is a shorter version of “magic cookie,” which is a term for a packet of data that a computer receives and then sends back without changing or altering it.

  No matter what it’s called, a computer cookie consists of information. When you visit a website, the website sends the cookie to your computer. Your computer stores it in a file located inside your web browser. (To help you find it, this file is often called “Cookies.”)

  The purpose of the computer cookie is to help the website keep track of your visits and activity. This isn’t always a bad thing. For example, many online retailers use cookies to keep track of the items in a user’s shopping cart as they explore the site. Without cookies, your shopping cart would reset to zero every time you clicked a new link on the site. That would make it difficult to buy anything online!

A website might also use cookies to keep a record of your most recent visit or to record your login information. Many people find this useful so that they can store passwords on frequently used sites, or simply so they know what they have visited or downloaded in the past.

Different types of cookies keep track of different activities. Session cookies are used only when a person is actively navigating a website; once you leave the site, the session cookie disappears. Tracking cookies may be used to create long-term records of multiple visits to the same site. Authentication cookies track whether a user is logged in, and if so, under what name.

References:
- https://us.norton.com/internetsecurity-privacy-what-are-cookies.html
