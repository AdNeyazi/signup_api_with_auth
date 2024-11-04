# Login/Signup API Authentication with Swagger Documentation     

This project implements a robust API authentication system for user login and signup functionalities, complete with Swagger documentation for easy reference and testing.

## Features
### User Registration (Signup):

Allows users to create a new account by providing required details (email, password, name).   
Validates input data to ensure compliance with specified criteria.   
Returns a success response upon successful account creation.  
### User Login:

Authenticates users by verifying their credentials (email and password).   
Generates a JSON Web Token (JWT) for session management upon successful login.   
Provides the token for subsequent authenticated requests.   
### User Logout:

Invalidates the session token, allowing users to securely log out.    
### API Documentation with Swagger
This project utilizes Swagger (OpenAPI) to automatically generate interactive documentation for the API.   
The documentation provides:   
Detailed descriptions of each endpoint.  
Required parameters and request/response formats.   
Authentication mechanisms in place.   
A user-friendly interface to test the API directly from the documentation.   

### Getting Started
To get started with this project, follow the instructions below:

#### Clone the repository:

`git clone https://github.com/AdNeyazi/signup_api_with_auth.git`   

`cd signup_api_with_auth`   

#### Install the necessary dependencies:

`bundle install`   

#### Set up the database:

`rails db:create`

then,   

`rails db:migrate`    

#### Start the server:


`rails server`     

#### Access the Swagger documentation at:


http://localhost:3000/api-docs   

### Contributing
Contributions are welcome! If you have suggestions or improvements, feel free to open an issue or submit a pull request.    

### Final Thoughts    

Thank you for taking the time to explore this project! We hope it serves as a valuable resource for your development journey. Remember, every line of code you write brings you closer to your goals.    
#### Happy coding!

