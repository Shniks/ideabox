---
Project: IdeaBox, A Rails Mini-Project
Name: Nikhil Shahi
Cohort: 1801 BE, Mod 2
---

### Project: IdeaBox

This purpose of this project is to create an app that lets users record their ideas. The project is hosted on [Heroku](https://idearepo.herokuapp.com/). Screenshots for some of the pages along with the project guidelines follow.  

### Screenshots

#### Landing Page

![this](/screenshots/landing_page.png)

#### Login Page

![this](/screenshots/login_page.png)

#### Welcome Page

![this](/screenshots/welcome.png)

#### Admin Images Index Page

![this](/screenshots/admin_image_index.png)

#### User Ideas Index Page

![this](/screenshots/user_idea_index.png)

#### User Idea Show Page

![this](/screenshots/user_idea_show.png)

### Project Guidelines  

#### Ideas

- An idea can be created, edited and destroyed only by the user that created it.  
- When a user types a new idea into the form, there is a [selection dropdown](http://guides.rubyonrails.org/form_helpers.html#option-tags-from-a-collection-of-arbitrary-objects) for choosing the correct category. See Categories below for more information.

#### Categories

- Ideas belong to a category.
- Categories can be created and destroyed by a logged-in admin user (regular logged in users cannot create categories).
- Categories can be destroyed by a logged-in admin user (regular logged in users cannot destroy categories).

#### Images

- Users can add an image to their own idea.
- An image can have many ideas and an idea can have many images.
- Images can only be created by an admin user.

#### Authentication and Authorization

- Users need to log in to see their ideas.
- Users can only see their own ideas -- they should not be able to visit another user's page.
- Users cannot create ideas for other users.
- Users cannot create new categories -- only the admin can do that.
- Users cannot create images -- only the admin can do that; however, a user can assign an image to their idea.
- Visitors can create user accounts.

### User Experience

- The application has been styled.
- The application uses a balanced, considered color scheme.
- The application implements a font (that is not the default font).
- The application utilizes a nav bar.
- The style shows evidence of intentional layout.
- Space and text is balanced. White space is used to visually separate content.
- The application is easily usable. The user can intuitively navigate between different portions of the application without manually entering the URL into the nav-bar or using the back button on their browser.

### Database

- Properly implements a one-to-many relationship
- Properly implements a many-to-many relationship
- Utilizes primary and foreign keys appropriately

### Code Quality

- Logic lives in the appropriate files
- Methods are refactored and follow SRP
- Naming follows convention

### Testing

- Project has a running test suite
- Test suite includes robust feature tests
- Test suite includes tests for validations
- Test suite includes tests for methods that they have created on the models
