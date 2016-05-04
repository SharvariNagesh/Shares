Shares
======

                           
  [![Build Status](https://travis-ci.org/SharvariNagesh/Shares.svg?branch=master)](https://travis-ci.org/SharvariNagesh/Shares)

**ABOUT THE PROJECT:** 
&nbsp;&nbsp;&nbsp; This is a web application to analyse basic financial data of shares traded in Indian stock market. The application is hosted on heroku and can be found here : https://shareanalysis.herokuapp.com/. This document covers specifications, design, instructions to install and run the application and license to use the application. 
         
**SPECIFICATIONS :**
&nbsp;&nbsp;&nbsp;"Share Analysis and Scoring" is an application to aid value investors analyse financial data of shares to make an investment decision.  Users of this application can extract financial data of any traded share and compare it with other shares from the same sector or with shares from different sectors. 

&nbsp;&nbsp;&nbsp;This application currently can extract only the basic financial data like name of the stock, information about the share, current market value, market capital, P/E(Price to earnings), Book value, P/B(Price to book value) 52 week high/low and sector  for any traded share from a financial website. Future plan is to extract entire financial data including balance sheet, profit and loss statements, cashflow data and analyse it in more detail. This web application can read basic data from Moneycontrol.com, a financial web  site for shares traded in Indian stock market. Users can also write/edit/delete their reviews/comments for each share. 

&nbsp;&nbsp;&nbsp;On the right hand side there is a side bar with description of the application and 2 links for extracting share data and to view all the share data in the database. By using the "Extract Share Data" link, users can retrieve the financial data of a share into the application database. To extract the data, click on the "Click here" link of the page, select a company you want the data to be extracted, copy its URL and paste it in the URL text box provided. Basic data will be extracted from the Moneycontrol website into this application. If a record for the share is already present in the database, then record will be updated with latest values. 

&nbsp;&nbsp;&nbsp;When you click on "All Shares", All the shares in the database will be displayed. Per page, only 10 shares will be displayed and one can navigate to next page using the pagination provided at the bottom of the page. 

&nbsp;&nbsp;&nbsp; Each share belongs to a sector. If one wishes to view shares belonging to that particular sector, they can click on the sector name in the share data. All the shares from the sector will be displayed. 

&nbsp;&nbsp;&nbsp;To view details about a share, click on the name of the share. A web page with detailed information about the share will be displayed. The detail page or show page will have complete information about the share and top 3 review comments sorted by priority. Show page also provides features to delete the share or go back to "All Shares" page, index page containing all the share details. It also provides a link to view all the reviews for the share.

&nbsp;&nbsp;&nbsp; Each review for a share has a name, priority and comments in it. Reviews are sorted based on the priority. Any business data, company information, observations or comments helpful to take an investment decision can be added in the review section. Reviews can also be edited or deleted.
     
**ENVIRONMENT AND COMPATIBILITY:**
&nbsp;&nbsp;&nbsp;This web application is developed on a ubuntu 14.04 LTS system with Ruby version 2.2.3 and rails version 4.2.5. The application is successfully tested with rails 4.2.5 and Rails edge.  Recommendation is to use Ruby version 2.0 or above, since Rails 4 prefers Ruby 2.0 and requires 1.9.3 or newer. If one has plan to upgrade, please refer to http://edgeguides.rubyonrails.org/upgrading_ruby_on_rails.html. 
       This application is known to be incompatible with IE7 and below. For a list of web servers supported, please refer to "Browser support" section of this page:  http://www.w3schools.com/cssref/pr_class_display.asp

**PROCEDURE TO INSTALL AND RUN THE CODE:**

&nbsp;&nbsp;&nbsp;Install Ruby and Rails on the system. Please refer to https://gorails.com/setup/ubuntu/14.04 for installing ruby on rails on Ubuntu 14.04. 
   
   To install the application please follow the below procedure :
   
 -  Download the zip file from github and copy the downloaded file into proper directory. 
 - extract the zip file in the current folder.
 - If postgress database is not the one you are planning to use and if postrgress is not already installed on your machine, open Gemfile and comment out the line .
 
	      #gem 'pg'
	      
    By default Sqlite database is used with the application. 
 -  Install all the required gem file for the project.
              
          $ bundle install
              
 - Migrate the db by running the below command :
		 
	    $ rake db:migrate
		 
 - To run the test suit, type below command:
		
	    $ bundle exec rspec

 - Start the web server provided along with rails as below
            
        $ rails s
 - Open the browser and type the url: localhost:3000 to open the web application.

**DESIGN DISCUSSIONS:**
&nbsp;&nbsp;&nbsp;The application uses two tables for storing the data used by the application. One for storing basic information of the share(name, sector, current market price, P/E, P/B, Book value, 52 week low/high and market cap) and the other for storing reviews(name, priority and comment). There is a one to many relation between the two tables. There can be multiple reviews for each share. Everytime 
reviews are listed, they will be sorted based on priority.

&nbsp;&nbsp;&nbsp;For Extracting a new share data into the application, use the "*Extract Share Data*" link on the side bar. URL from moneycontrol website for the share has to be entered in the "URL:"  text box.  The URL entered by the user is not stored in the database. The reason for this is, in the next phase, a table containing all the names of the share and their URLs will be stored in a separate table. So to avoid duplication, in the current version, URL is not being stored in the database. But without having URL as part of the share data it can not be used in the view as form parameter. To facilitate retrieval of URL, it has been added as part of the model as a variable as shown below.

        attr_accessor :url 

&nbsp;&nbsp;&nbsp;Since URL for the share is not stored in the database, a separate edit(or re-extract) feature is not provided. Instead after the share data is read successfully, it will be checked if a record for the share already exists in the database. If it is present, then the same record will be updated or a new one will be created using ActiveRecord::Relation Method, "*first_or_initialize*". 

&nbsp;&nbsp;&nbsp; The controller after getting the URL makes sure it is not empty and calls a private method sanitize_website. sanitize_website method makes sure that url belongs to Moneycontrol.com website by comparing url with the regular expression. "open" method of 'open-uri' raises exception if the URL does not contain "http://" or "https://". sanitize_website also takes care of prepending URL with "http://" if it is not already present.

&nbsp;&nbsp;&nbsp;For extracting the data from the URL, nokogiri gem is used. A protected method, "*readShareBasic*" is defined in application_controller.rb which opens the URL and reads all the required values from the website. shares_controller method calls the *readShareBasic* method and passes the sanitized url as parameter. "*readShareBasic*" method returns a hash (named parameterHash) containing values extracted from the URL. An exception handler catches any exception thrown by web scrapping code during extraction. Any exception raised by nokogiri code will be passed to the calling method by including an "error" key in parametherHash. Errors during HTML scrapping will be communicated to the user by setting *flash[:error]* and view takes care of displaying the error message appropriately.  If the record is created or updated successfully, user will be informed by setting flash[:notice]

&nbsp;&nbsp;&nbsp;Both in review table and share table validations are included to make sure the important fields are present and are valid. If any invalid data is entered by user, a proper error message will be displayed using flash[:error]

&nbsp;&nbsp;&nbsp;A CSS template from http://www.free-css-templates.com/ is used for the project and is modified to suit project's requirement.

&nbsp;&nbsp;&nbsp; will_paginate gem is used to have multiple pages. In each page 10 share information will be printed.

&nbsp;&nbsp;&nbsp;Shares belonging to a particular sector can be viewed by clicking on the sector name in the share index page. To display sector-wise information, a route is added in the config/routes.rb file, which will direct the requests for sector-wise share information to method "sector" in the shares_controller.rb.  Similarly, there are 2 more routes added for "About" and "Contact" pages. 
  
		            
**LICENSE:**

&nbsp;&nbsp;&nbsp;This is free and unencumbered software released into the public domain.

&nbsp;&nbsp;&nbsp;Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.

&nbsp;&nbsp;&nbsp;In jurisdictions that recognize copyright laws, the author or authors of this software dedicate any and all copyright interest in the software to the public domain. We make this dedication for the benefit of the public at large and to the detriment of our heirs and successors. We intend this dedication to be an overt act of relinquishment in perpetuity of all present and future rights to this software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to http://unlicense.org/

   
                       
