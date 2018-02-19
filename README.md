# secretMessages
Back-end Service for storing secret messages at different locations.

## Installation

1. Install Ruby 2.3.3.
2. Install Ruby on Rails 5.1.5.
3. Install PostgreSQL locally.
4. Create an .env file in the project root folder. Define the local database username and password:
	```
	SECRET_MESSAGES_LOCAL_DATABASE_USERNAME
	SECRET_MESSAGES_LOCAL_DATABASE_PASSWORD
	```
5. Run `bundle install`
6. Create database and run migrations.
7. Run tests and rubocop code analysis using `rails secretMessages:test`
8. Code coverage information is available on `coverage/index.html`
9. Run `rails swagger:docs` to generate API Documentation.
10. Run server using `rails server`
11. An interactive API Documentation is available at `http://localhost:3000/` and `http://localhost:3000/docs`
 12. Enjoy!

## Contact
In case of issues please contact:

**José Hernández González**
*Full-Stack Developer*
gjhernandez@uninorte.edu.co
