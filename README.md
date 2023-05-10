# Information

This README contains the information relating to the project and the program itself.
The 'WMG Calculator Project' was made by **Team 24** for the **Department of Music at the University of Sheffield**.
Credit to the University of Sheffield Department of Computer Science for the template that Team 24 (Chengyu Fu, Xueyi Huang, Keshav Joshi, Junming Luo, Yupeng Mao, James Oyaide, Chloe Creak and Theo Cruddace) used to create the rails application.


## System Information
### Ruby on Rails
The project uses **Ruby** version: **3.1.2** on **Rails** version: **7.0.4.2**.

### PostgreSQL
The database is SQL handled by **PostgreSQL** version: **14**.

### Installation
To use the project with git, follow these commands.

First clone the project
```git clone git@git.shefcompsci.org.uk:com3420-2022-23/team24/project.git``` 
Or alternatively, to use the HTTP method:
```git clone https://git.shefcompsci.org.uk/com3420-2022-23/team24/project.git```

In the project directory, run these commands:
```cp config/database-sample.yml config/database.yml```
```bundle install```
```yarn install```

```bundle exec rails db:create```
```bundle exec rails db:migrate```
```bundle exec rails db:seed```

The project is now installed appropriately. In order to run the application use the following commands in the applications directory.
```bundle exec rails s```
Create a separate terminal window/tab (whilst still in the application directory) and run:
```bin/webpacker-dev-server```

If you now visit http://localhost:3000 in a browser you should see your application.
**If an error message with regards to PendingMigrations occurs, press the button that states 'Run pending migrations'**

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
