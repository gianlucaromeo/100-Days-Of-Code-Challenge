# Days 2 to 5 - OAuth 2.0 in Rails API

Read more on [my X account](https://twitter.com/__gianluc4) and [my Thread account](https://www.threads.net/__gianluc4)!

## Day 2
✔️ Created Rails API project
<br>
✔️ SignUp, Login, Profile
<br>
✔️ Tested JWT authentication with Postman
<br>

## Day 3
✔️ E-mail confirmation
<br>
✔️ Password recovery
<br>
✔️ Automate some task with Rake

## Day 4
✔️ Refactored controllers
<br>
✔️ Tested registration controller

## Day 5
✔️ Tested login controller
<br>
✔️ Tested password controller
<br>
✔️ Started testing users controller

# Useful resources
- [What is OAuth 2.0](https://auth0.com/intro-to-iam/what-is-oauth-2)
- [Official Rails API guide](https://guides.rubyonrails.org/api_app.html)
- [A guide to Rails authentication using JWT](https://dev.to/mohhossain/a-complete-guide-to-rails-authentication-using-jwt-403p)


# Table of contents
1. [What is OAuth 2.0?](#1-what-is-oauth-20)
2. [What is Rails API?](#2-what-is-rails-api)
3. [Rails API commands](#3-rails-api-commands)

## 1. What is OAuth 2.0
OAuth 2.0 stand for "Open Authorization 2.0", and is a standard designed to allow a website or app to access resources hosted by other websites of apps on behalf of a user.

### Principles of OAuth 2.0
- OAuth 2.0 is an **authorization protocol**
- OAuth 2.0 is NOT an authentication protocol
- OAuth 2.0 uses **Access Tokens**. These are pieces of data that represent the authorization to access resources on behalf of the end-user.
- OAuth 2.0 does not define a specific format for Access Tokens, but the Json Wen Token (JWT) format is often used.

### OAuth 2.0 Roles
- **Resource Owner**: the user or system that owns the protected resources.
- **Client**: the system that requests access to the protected resources. To access these resources, the Client must hold the appropriate Access Token.
- **Authorization Server**: this server receives requests from the Client and issues them upon succesful authentication and consent by the Resource Owner.
- **Resource Server**: a server that protects the user's resources and receives access requests from the Client. It accepts and validates an Access Token from the Client and returns the appropriate resources to it.

## 2. What is Rails API?
Rails API is a subset of a regular Rails application, to create an API-only application in Rails, stripping away any middleware and module not needed for API-only applications. This includes routing, controllers, and rendering, but excludes any view-related modules.

### What does Rails API offer?
- At the **middleware layer**:
    - Transparent reloading
    - Development mode
    - Test mode
    - Logging
    - Security
    - Parameter Parsing
    - Conditional GETs
    - Conversion of HEAD Requests into GET ones
- At the **Action Pack layer**:
    - Routing
    - URL Generation
    - Header and Redirection Responses
    - Caching
    - Basic, Digest, and Token authentication
    - Instrumentation
    - Generators
    - Plugins

## 3. Rails API commands
- `rails new my_rails_api --api`: Create a new Rails API project
- `bundle install`: Install the dependencies
- `rails g model user username password_digest bio --no-test-framework`: Create a user model with a secure password storage
- `has_secure_password`: (From bcrypt) Adds funcionality to save passwords as a hashed `password_digest` in the database. Note that the password_digest column is required in the relevant database table.
-  `validates: :username, :uniquieness: true`: A way to enforce that every username in the database is unique.
- `rails db:migrate`: Database migration
- `rails g controller users`: Create a UsersController
- `rails serializer User`: Create a UserSerializer
- `rails server`: Start a server
- `rails generate migration AddEmailToUsers email:string`: Add fields to a model
- `rake db:delete_users`: Run the "delete_users" taks with rake in `lib/tasks/delete_users.rake`
- `rails test`: Run tests
