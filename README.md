# Project Architecture

In order to break down the task I created the following diagram and then broke down the needed tasks in [this](https://www.notion.so/6ab09f33afd74993ae80581b128906fa?v=a23f9148655d4cbd925f80cbc974ce6c&pvs=4) notion board. In the
following diagram, we modeled the database tables and the relationships between them:

<img src="Org charts.png"/></img>

# Prerequisites

To run your application ensure that is installed on your machine by running:
```
docker --version
```

# How to run and deploy the application
1. Build the application by running:
```
 docker-compose build
```
2. Deploy the application by running:
```
docker-compose up
```
3. To Stop the application run:
```
docker-compose down
```
To test the application through Postman you can also use [this](https://www.postman.com/altimetry-geoscientist-34714272/workspace/chat-system) collection.

# Fixes
The following fixes are available on the `fix-branch`:
1. Message search endpoint
2. Endpoint validations 
