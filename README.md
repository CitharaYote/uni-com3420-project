# WMG Calculator

<p align="center">
  <img src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white" alt="Ruby" />
  <img src="https://img.shields.io/badge/Rails-CC0000?style=for-the-badge&logo=rubyonrails&logoColor=white" alt="Rails" />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL" />
  <img src="https://img.shields.io/badge/Tailwind_CSS-06B6D4?style=for-the-badge&logo=tailwindcss&logoColor=white" alt="Tailwind CSS" />
  <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white" alt="Bootstrap" />
</p>

## Overview

WMG Calculator is a Ruby on Rails application built to help staff in the University of Sheffield Department of Music manage student module marks and calculate weighted mean grades.

The project was originally created by Team 24 for COM3420. The team members were Chengyu Fu, Xueyi Huang, Keshav Joshi, Junming Luo, Yupeng Mao, James Oyaide, Chloe Creak and Theo Cruddace. It was developed from a Rails template provided by the University of Sheffield Department of Computer Science.

The application supports:

- CSV mark imports for student module results
- student, module, programme and staff management
- weighted mean grade and award classification calculations
- programme and module filtering from the main dashboard
- notifications for newly imported programmes/modules and old student records
- staff-only access control with admin permissions for staff management
- Sheffield LDAP/CAS authentication through `epi_cas`

## Preview

A separate mockup of the site is available in the <a href="https://github.com/CitharaYote/uni-com3420-project-mockup">mockup repository</a>.

Give the hosted mockup a go <a href="https://citharayote.github.io/uni-com3420-project-mockup/">here</a>!

## Getting Started

### Dependencies and Prerequisites

You will need:

- Ruby `3.1.2`
- Bundler `2.3.7`
- PostgreSQL `14`
- Node.js and Yarn
- access to the private Sheffield `epi_cas` gem source used in the `Gemfile`

The project uses PostgreSQL for Rails data storage, Shakapacker/Webpack for front-end assets, Tailwind CSS and Bootstrap for styling, Devise with `epi_cas` for authentication, CanCanCan for permissions, and RSpec/Capybara for testing.

### Installation

Clone the repository:

```bash
git clone https://github.com/CitharaYote/uni-com3420-project.git
cd uni-com3420-project
```

Install the required Ruby and JavaScript dependencies:

```bash
gem install bundler:2.3.7
bundle install
yarn install
```

Create your local database configuration:

```bash
cp config/database-sample.yml config/database.yml
```

Then create and prepare the database:

```bash
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

### Usage

Start the Rails server:

```bash
bundle exec rails server
```

In a second terminal, start the Webpack development server:

```bash
bin/webpacker-dev-server
```

Open <a href="http://localhost:3000">http://localhost:3000</a> in your browser.

To run the test suite:

```bash
bundle exec rspec
```

## Notes

Development and test environments use LDAP authentication, while QA, demo and production use CAS. A user must also have a matching `Staff` record before they can sign in successfully.

The seed file creates a placeholder user, but it does not create a staff record. If you are setting up a local development database from scratch, you may need to create an appropriate `Staff` record for your test user before the app grants access.

CSV imports expect the column names used by the sample mark files in `spec/features/test_file`, including `Module Code`, `Programme Code`, `Reg No.`, `Forename`, `Surname`, `Reg. Status`, `1st Grade` and `2nd Grade`.

If Rails reports pending migrations in development, run:

```bash
bundle exec rails db:migrate
```

## Get in Touch

<p align="center">
  <i>Built with <b>code</b>, <b>caffeine</b>, and 💜 by CitharaYote</i>
</p>

<p align="center">
  <a href="https://citharayote.xyz">
    <img src="https://img.shields.io/badge/Portfolio-Visit%20my%20site-8A2BE2?style=for-the-badge&logo=firefoxbrowser&logoColor=white" alt="Portfolio" />
  </a>
  <a href="https://github.com/CitharaYote">
    <img src="https://img.shields.io/badge/GitHub-CitharaYote-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub" />
  </a>
  <a href="https://www.linkedin.com/in/theo-cruddace/">
    <img src="https://img.shields.io/badge/LinkedIn-Connect%20with%20me-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn" />
  </a>
  <a href="mailto:theocruddace@gmail.com">
    <img src="https://img.shields.io/badge/Email-Say%20hello-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Email" />
  </a>
</p>

<p align="center">
  <i>Like what I’m building? Feel free to support my work!</i>
</p>
<p align="center">
  <a href="https://www.buymeacoffee.com/citharayote">
    <img src="https://img.shields.io/badge/Buy%20me%20a%20coffee-Fuel%20my%20addiction-FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=black" alt="Buy Me a Coffee" />
  </a>
</p>
