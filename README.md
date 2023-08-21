<h1>Vet-Clinic Database Project</h1>
Welcome to this project, where you'll employ a relational database to establish the foundational data framework for a veterinary clinic. Your tasks will be designing a table dedicated to housing details about various animals, populating it with relevant data, and executing queries to retrieve information.


## Before Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

<a name="readme-top"></a>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [❓ FAQ](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Vet-Clinic Database <a name="about-project"></a>

Welcome to this project where we'll build a special database for a vet clinic. This database will hold information about different animals, like their names, when they were born, if they tried to escape, if they've been neutered, how heavy they are, and what kind of animal they are. We'll use a language called SQL to set up the database, put in some example info, and ask questions to get useful answers.


## 🛠 Built With <a name="built-with"></a>
The project is built using SQL for database management.
Getting Started
Follow these steps to understand and work on the project:


### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **Database Management:** Create and manage a relational database using SQL commands.
- **Data Manipulation:** Add, update, and remove data of the database using SQL statements.
- **Querying Data:** Utilize SQL queries to extract data from the database.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

### 🛠 Setup <a name="setup"></a>

1. Clone this repository to your local machine:

```bash
git clone https://github.com/grauJavier/vet-clinic
```

2. Set up a PostgreSQL database named `vet_clinic`.

### Database Structure

The `schema.sql` file includes SQL commands to create the `animals` table with the following columns:

- `id`: A unique identifier for each animal.
- `name`: The name of the animal.
- `date_of_birth`: The birthdate of the animal.
- `escape_attempts`: The number of escape attempts made by the animal.
- `neutered`: A boolean indicating if the animal is neutered.
- `weight_kg`: The weight of the animal in kilograms.
- `species`: The species of the animal.

You can execute the `schema.sql` file to create the table structure by running:

```bash
psql -d vet_clinic -a -f schema.sql
```

Before you do anything, make sure you have PostgreSQL set up on your computer. If that's good to go, then you're ready to use the command.

Customize the explanations and the way things are organized in the columns to match what your project needs.

Remember, the design and setup of the database we're giving you fit what your project wants. But you can change things around if you have to.

## 🛠 Usage <a name="usage"></a>
The data.sql file has special instructions written in SQL. These instructions make pretend information go into the animals table. This way, the table gets filled up with details about lots of animals.

The queries.sql file has more SQL instructions. These help answer different questions about the animal info. The questions are about things like picking certain animals using rules, getting specific details, and doing math with all the info added up.

When you run these instructions and get answers, you can snap pictures of the results to show what you did.

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Javier Grau**
- GitHub: [@grauJavier](https://github.com/grauJavier)
- Twitter: [@jgrauchile](https://twitter.com/jgrauchile)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/javiergrau)

👤 **Lawrence Muema Kioko**
- GitHub: [@githubhandle](https://github.com/Kidd254)
- Twitter: [@twitterhandle](https://twitter.com/lawrenc98789206)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/lawrence-muema-kioko)

👤 **Manuel Sánchez**
- GitHub: [Luffytaro22](https://github.com/Luffytaro22)
- LinkedIn: [Manuel Sánchez](https://www.linkedin.com/in/manuel-alejandro-sanchez-sierra-4b358b14a/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- **User Login:** Make a way for users to log in and do things based on what they're allowed to do.
- **Setting Up Appointments:** Add something so users can set up appointments for animals. Like when they need to see the vet, get shots, or have an operation.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>


We welcome contributions to enhance AirMetrics and expand its capabilities. To contribute:

1. Fork the repository.

2. Create a new branch for your feature: `git checkout -b feature-new-feature`.

3. Commit your changes: `git commit -m 'Add new feature'`.

4. Push to the branch: `git push origin feature-new-feature`.

5. Open a pull request detailing your changes.

Let's work together to provide valuable air quality information to the people of Chile!

Also issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/grauJavier/vet-clinic/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project and know someone who might find it helpful, please share it.
Or give it a **star** ⭐️

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I want to give a big thanks to Microverse and everyone I've been working with here. They let me be part of this project, and I'm really grateful.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

## ❓ FAQ <a name="faq"></a>

- **How do I get the PostgreSQL database ready for this project?**
  - Copy everything from this project onto your computer.
  - Make a new PostgreSQL database and call it "vet_clinic".
  - Do all the things written in the "schema.sql" file to set up the table like we need it.
  - Put pretend info into the database using the stuff in the "data.sql" file.

- **What's the way to use the instructions in the "queries.sql" file?**
  - To use the instructions in the "queries.sql" file, you can pick a tool like psql or pgAdmin. They work for talking to PostgreSQL.
  - Connect your tool to the "vet_clinic" database.
  - Do the instructions from the file. This gets you the info you want from the database.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](MIT.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>