# README

Backend Job Board
In this task we are implementing a simple Job Board backend API. Detailed specifications for the test project are provided below.

Project Description
The Job Board API will be used by your Users (Job Seekers) to perform the following tasks:
● List Job Posts
● Apply to Jobs
Every User (Job Seeker) will have their own job applications that have statuses that can be checked (seen, not seen).

The Job Board app will be used by your Recruiter to perform the following tasks:
● Manage A Job Post
● List Job Applications
● List Job Posts

Technical details
The backend should be able to serve all kinds of clients - using a RESTful API.
The following technical requirements are placed on the implementation:
API
● Ruby (v2.7+) with Ruby on Rails framework (v6.0+)
● HTTP responses follow best practices
● API communicate with their clients using JSON data structures
● Authentication for users implemented using devise

Data Storage
● All data stored in a relational database, using Sqlite3.

Users
● Registrations were done with email and password (Job Seekers)
● The following functionality were implemented:
● User Registration (create user)
● User Login

Job Post data
● The following functionality were implemented:
● Job Post must have: title, description
● Create a new Job Post
● List all Job Applications

Job Applications
● The following functionality were implemented:
● Job seekers apply to any job by creating a Job Application that will have a status of (Not Seen) by default