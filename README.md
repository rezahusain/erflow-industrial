# ERFlow by Reza Husain
Revolutionizing emergency room efficiency by seamlessly prioritizing patient care and reducing wait times.

# Instructions
Howdy! I'm assuming your here because you wanted to get some treatment by a doctor or maybe your just curious? If so let me walk you through getting set up!

Step 1: Clone this repository over to your local machine by running ```git clone https://github.com/rezahusain/erflow-industrial.git``` in your terminal.

Step 2: After cloning it, make sure to run ```bundle install``` just in case there are any Ruby gems which may or not be installed already.

Step 3. Type in ```bin/dev``` in your terminal and press enter. This will start up your local server where you can access my application.

Your all set! 

# Configuration
Before starting the application, there are a few configuration steps to follow:

1. Environment Variables:
If you're deploying locally or using a different service, ensure you set up the necessary environment variables. For local development, you can create a .env file in the root of the project and add the following variables:
```DATABASE_URL=your_database_url```<br>
```SECRET_KEY_BASE=your_secret_key_base```

2. Render Configuration:
If you are deploying to Render, the environment variables and database configuration are handled by the render.yaml file.

3. Running Migrations:
After setting up the environment variables and database configuration, run the following command to set up the database:
```rails db:setup```

# ERD
<img width="1440" alt="Screenshot 2024-07-29 at 9 41 49 AM" src="https://github.com/user-attachments/assets/d336c2f6-c93f-4d68-9d54-d13b026ab8d0">

# FAQ
Q: Who can I contact for support? <br>
A: If you encounter any issues or have any questions, please feel free to open an issue on the GitHub repository or contact me directly through my GitHub profile.
