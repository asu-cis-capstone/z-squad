# z-squad
repo for project zoophy

ZooPhy README

Overview
	ZooPhy is web application aimed at providing helpful and insightful analysis on virus trajectories to researchers and public health agencies. Using ZooPhy, users from around the world can access the repository of virus samples held in ZooPhy’s databases to find histories and construct phylogenetic trees and construct a visual trajectory of the virus’ pathways in populations. Users will be able to select specific criteria from virus type to host species and can drill down even further for advanced users. ZooPhy will start their query, which may take up to a few days, and then send them a notification when the process has been completed. This will produce a phylogenetic tree of the virus and also a KML file to place against Google Earth so the trajectory of the virus through populations can be viewed geographically by the user. 

List of Contributors
•	Dr. Matthew Scotch
•	Mehrad Noghrehchi
•	Andrew Paxia
•	Bryan Mercado
•	Jeff Recker
•	Hunter Bryan

Release Notes
v 0.1: 

README file created.

Visual mockup created. <https://drive.google.com/a/asu.edu/file/d/0B6XMxKdhKp0xN1pwbnRGcUY5eVk/view?usp=sharing>

Waffle.io started. 

v 0.2 
Current PHP/MySQL framework uploaded to Github. 

Install Instruction:

1. Install WAMP server on local machine
2.Type localhost into browser to access phpmyadmin
3. Create DB with name "Users", and table "accounts" table to store user account information
4. Drop Zoophy folder into c/wamp/www directory in computer
5. Once table created,  the connect folder connects the front end to DB on local machine
6. Open localhost, select Zoophy and home page loads
7. Click "login" and login page accepts account info and logs user in

v0.3 
New Release:
This release includes a new layout and color scheme for the site. Navigation and links are updated and sample pages with dummy data have been used for lgin and view jobs purposes. 

The page also integrates Google Maps to display the desired look for mapping KML files in the future. 

Instructions:
To view new project, use WAMP server to load index.html and navigate through links form there as you would a regular site. 

v0.4
Video Demo done. Note that not all features work. Still trying to get bugs out, but this gives a simple rundown of the service and how it will work. 
Address is below:

http://youtu.be/e-vd6ZP917w

v0.5
DEMO 1.2 folder is the current updated project. Things need to be done:
-Connect back end (signup/login)
-fix CSS styling 
-get web app to send/recieve correct data from web service
