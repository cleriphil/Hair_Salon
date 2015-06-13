##Hair Salon

###Description:
Hair Salon is an app to keep track of stylists and clients. Users may add and delete stylists to the app. For each stylist, the user can add and delete clients. 
The app allows for users to update the names of clients. All information is saved into a database. 


### Setup Instrucitons:

Run the following in terminal:

postgres

psql

CREATE DATABASE hair_salon;

CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);

CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);

CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

ruby app.rb

Navigate to localhost:4567 in browser

MIT License
