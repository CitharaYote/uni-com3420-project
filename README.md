# Information

This README contains the information relating to the project and the program itself.
The 'WMG Calculator Project' was made by **Team 24** for the **Department of Music at the University of Sheffield**.
Credit to the University of Sheffield Department of Computer Science for the template that Team 24 (Chengyu Fu, Xueyi Huang, Keshav Joshi, Junming Luo, Yupeng Mao, James Oyaide, Chloe Creak and Theo Cruddace) used to create the rails application.


## System Information

### Ruby on Rails
The project uses **Ruby** version: **3.1.2** on **Rails** version: **7.0.4.2**.

### PostgreSQL
The database is SQL handled by **PostgreSQL** version: **14**.

### Tailwind
The system uses **Tailwind CSS** version: **3.3.1** 

### Installation
To use the project with git, follow these commands.<br>

First clone the project<br>
```git clone git@git.shefcompsci.org.uk:com3420-2022-23/team24/project.git``` <br>
Or alternatively, to use the HTTP method:
```git clone https://git.shefcompsci.org.uk/com3420-2022-23/team24/project.git``` <br>

In the project directory, run these commands:
```cp config/database-sample.yml config/database.yml``` <br>
```bundle install```<br>
```yarn install```<br>

```bundle exec rails db:create```<br>
```bundle exec rails db:migrate```<br>
```bundle exec rails db:seed```<br>

The project is now installed appropriately. In order to run the application use the following commands in the applications directory.
```bundle exec rails s```<br>

Create a separate terminal window/tab (whilst still in the application directory) and run:<br>
```bin/webpacker-dev-server```

If you see a message regarding shakapacker version, do not worry, you can run this command to update the version <br>
```gem install shakapacker``` to fix it, or alternatively you can ignore it.<br>


If you now visit http://localhost:3000 in a browser you should see your application.<br>
**If an error message with regards to PendingMigrations occurs, press the button that states 'Run pending migrations'**

### Files
app/controllers contains page controllers and the application controller itself. It has connects and references to Devise and CanCanCan
app/models contains Ruby models (ActiveRecords) with their schema table information.
app/views contains the .erb and .haml files for pages for which the css stylesheets can be found in app/packs/styles
Things you may want to cover:

