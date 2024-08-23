# ERFlow by Reza Husain
Revolutionizing emergency room efficiency by seamlessly prioritizing patient care and reducing wait times.

## Instructions
Howdy! I'm assuming your here because you wanted to get some treatment by a doctor or maybe your just curious? If so let me walk you through getting set up!

Step 1: Clone this repository over to your local machine by running ```git clone https://github.com/rezahusain/erflow-industrial.git``` in your terminal.

Step 2: After cloning it, make sure to run ```bundle install``` just in case there are any Ruby gems which may or not be installed already.

Step 3. Type in ```bin/dev``` in your terminal and press enter. This will start up your local server where you can access my application.

Your all set! 

## Main Features
In this video, I walk you through the process of filling out an injury form, seeing where you are within the queue, and viewing the notes left on your queue spot by the hospital admin.<br />

https://github.com/user-attachments/assets/27331265-8b5f-47a4-a9a7-70e1df0d861b

## Technologies Used ⚙️
- Ruby version: `3.2.1`
- Rails version: `7.1.3`
- Bootstrap version: `5.3.1`
- Ajax version: `6.1.1`

### Additonal gems added to applications
- [`appdev_support`](https://github.com/firstdraft/appdev_support)
- [`annotate`](https://github.com/ctran/annotate_models)
- [`awesome_print`](https://github.com/awesome-print/awesome_print)
- [`better_errors`](https://github.com/BetterErrors/better_errors)
- [`binding_of_caller`](https://github.com/banister/binding_of_caller)
- [`dotenv-rails`](https://github.com/bkeepers/dotenv)
- [`draft_generators`](https://github.com/firstdraft/draft_generators/)
- [`draft_matchers`](https://github.com/jelaniwoods/draft_matchers/)
- [`devise`](https://github.com/heartcombo/devise)
- [`faker`](https://github.com/faker-ruby/faker)
- [`grade_runner`](https://github.com/firstdraft/grade_runner/)
- [`htmlbeautifier`](https://github.com/threedaymonk/htmlbeautifier/)
- [`http`](https://github.com/httprb/http)
- [`pry_rails`](https://github.com/pry/pry-rails)
- [`rails_db`](https://github.com/igorkasyanchuk/rails_db)
- [`rails-erd`](https://github.com/voormedia/rails-erd)
- [`rolify`](https://github.com/RolifyCommunity/rolify)
- [`rspec-html-matchers`](https://github.com/kucaahbe/rspec-html-matchers)
- [`rspec-rails`](https://github.com/rspec/rspec-rails)
- [`rubocop`](https://github.com/rubocop/rubocop)
- [`rufo`](https://github.com/ruby-formatter/rufo)
- [`specs_to_readme`](https://github.com/firstdraft/specs_to_readme)
- [`table_print`](https://github.com/arches/table_print)
- [`webmock`](https://github.com/bblimke/webmock)
- [`will_paginate`](https://github.com/mislav/will_paginate)
- [`simple_form`](https://github.com/heartcombo/simple_form)
- [`pundit`](https://github.com/varvet/pundit)
- [`sprocket_rails`](https://github.com/rails/sprockets-rails)

## Configuration
Before starting the application, there are a few configuration steps to follow:

1. Environment Variables:
If you're deploying locally or using a different service, ensure you set up the necessary environment variables. For local development, you can create a .env file in the root of the project and add the following variables:
```DATABASE_URL=your_database_url```<br />
```SECRET_KEY_BASE=your_secret_key_base```

2. Render Configuration:
If you are deploying to Render, the environment variables and database configuration are handled by the render.yaml file.

3. Running Migrations:
After setting up the environment variables and database configuration, run the following command to set up the database:
```rails db:setup```

## Installation 🛠️

### Current Main Branch: rails 7 
* Clone the repository and switch to the main branch
* Run the following commands

```sh
bundle install
rails db:migrate
rake sample_data
bin/dev
```
After running the above commands you will have generated all the data needed to see the app functioning. The user Alice will have access, you can sign in with:

* Email: ``alice@example.com``
* Password: ``password``

Or make your own personal account by signing up!

## ERD
<img width="1440" alt="Screenshot 2024-07-29 at 9 41 49 AM" src="https://github.com/user-attachments/assets/d336c2f6-c93f-4d68-9d54-d13b026ab8d0" />

## FAQ
Q: Who can I contact for support? <br />

A: If you encounter any issues or have any questions, please feel free to open an issue on the GitHub repository or contact me directly through my GitHub profile.

## Testing

Testing Branch Protection 
