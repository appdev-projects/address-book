# Address Book

This project is similar to Contact Book — we'll have two models, `Contact` and `Company` — but:

 - we're going to use the shortcut to generate the tables automatically
 - we're going to use a rake task that I've written to quickly fill the tables with dummy data
 - we're going to focus on querying practice — how to use `.where`, essentially

It would be good to have [the ApplicationRecord Chapter](https://chapters.firstdraft.com/chapters/770) open in a tab as a reference while you are experimenting.

## Setup

 1. From [your Cloud9 repositories list](https://c9.io/account/repos), set up a workspace [as usual](https://guides.firstdraft.com/starting-on-a-project-in-cloud9).
 1. Set up the project by running this command at a Terminal prompt: `bin/setup`

## Shortcuts

The ultimate shortcuts for generating our migrations _and_ model files all at once:

```bash
rails generate draft:model contact first_name:string last_name:string date_of_birth:date
```

```bash
rails g draft:model company name:string industry:string structure:string last_year_revenue:integer founded_on:date
```

Glance over the migration files to make sure there are no typos, and then don't forget to:

```bash
rails db:migrate
```

to execute the migrations and actually create the tables.

## Dummy data

That's it! Our tables and models are ready to go. Now fire up a `rails console` to pull up an interactive REPL. Then try:

 - `Contact.count` and `Company.count` — verify that there's nothing in there yet.
 - You can use `.new` and `.save` to create a row or two.

It would take us forever to manually add enough records to make querying interesting. So, I've written a `.rake` file that will populate some records for us automatically. Go check out the file `lib/tasks/dummy.rake` and read it. Does it make sense?

The one new thing in there is the line `namespace(:dummy)`. This makes it so that when you want to run the tasks within from the command line, rather than saying

```bash
rails random_contacts # won't work
```

or

```bash
rails random_companies # won't work
```

you have to say instead

```bash
rails dummy:random_contacts
rails dummy:random_companies
```

This allows us to keep multiple tasks with the same name from conflicting. (It is, for example, quite common to have two tasks named something like "poll", one for the Twitter API and one for the Instagram API. You would namespace them to keep them straight so you could do `rails twitter:poll` and `rails instagram:poll`.)

Anyway, try running `rails dummy:random_contacts` now. Then, in `rails console`, do `Contact.count`. Experiment with some [READ methods](https://chapters.firstdraft.com/chapters/770#read).

## ActiveAdmin

In all of our Rails apps in this course, we'll include a nice third-party open-source library called [ActiveAdmin](https://activeadmin.info/). ActiveAdmin provides a decent visual overview of our database tables without any configuration required _at all_. (ActiveAdmin is also extremely powerful — it's a whole mini-framework unto itself — and will allow you to build very flexible admin dashboards if you invest some energy learning its methods. But we will just stick to the defaults for now.)

### Starting the Rails server

To see the admin dashboard, we need to first launch our web server for the first time! Open a new Terminal tab, and at the command prompt, paste this in:

```bash
rails server -b $IP -p $PORT
```

This command will start the `server` program, much like `rails console` started the `console` program, and this Terminal tab will now be dedicated to that program — we can't do anything else in this tab, unless we shut the server down with <kbd>Ctrl</kbd>-<kbd>C</kbd>. Usually I just open a new Terminal tab if I need to do other things, and I leave this one running the server.

#### Cloud9 shortcut — Run Project

Typing in that command is sort of annoying due to the `-b $IP -p $PORT` stuff, so Cloud9 has a shortcut for us: you can just click the "Run Project" button at the top of the IDE from now on, and it will open a new Terminal tab and run the `rails server` command for you.

### Navigating to the live application URL

Okay, now to actually visit our application, we need to know what URL it is running at. To find out, click the "Preview" menu in Cloud9, and select "Preview Running Application". This will open a pane with your app in it!

What you see initially, the "Yay! You're on Rails!" page, is the default when we haven't added our own homepage yet. We'll get there. For now, add `/admin` onto the URL of your app — it will look something like

```
https://address-book-demostudent8.c9users.io/admin
```

but with your own username in the middle of the URL.

`/admin` is the default path that ActiveAdmin uses for the dashboard, but we can customize this. You can sign in with the account:

 - Username: `admin@example.com`
 - Password: `password`

And explore!

One last thing: since we're so strapped for real-estate within our Cloud9 IDE, I usually like to open my live application in its own Chrome tab. You can click the small button with an arrow inside it next to the address bar to pop it out into its own tab, or just copy-paste the URL.

Welcome to your first live web app! Soon we'll learn how to add our own interface to our tables, but having this immediate dashboard for free (where you can even download CSVs of your data) is very handy.
