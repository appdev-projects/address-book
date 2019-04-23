# Contact Book

In this project, we'll have our first contact with saving data permanently in a database.

## Setup

 1. From [your Cloud9 repositories list](https://c9.io/account/repos), set up a workspace [as usual](https://guides.firstdraft.com/starting-on-a-project-in-cloud9).
 1. Set up the project by running this command at a Terminal prompt: `bin/setup`

## Key code snippets

To generate your migration file, copy this command to a Terminal prompt:

```bash
rails generate migration CreateContacts
```

Then put this code in the file that is created in the `db/migrate` folder:

```ruby
class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table(:contacts) do |table|
      table.string(:first_name)
      table.string(:last_name)
      table.date(:date_of_birth)

      table.timestamps
    end
  end
end
```

Execute the migration with the Terminal command:

```bash
rails db:migrate
```

In the `app/models` folder, create a file called `contact.rb` and put this code inside:

```ruby
class Contact < ApplicationRecord
end
```

That's it! Now fire up a `rails console` to pull up an interactive REPL, and use [the ApplicationRecord Chapter](https://chapters.firstdraft.com/chapters/770) as a reference to experiment.

## Shortcuts

The ultimate shortcuts for generating our migrations _and_ model files:

```bash
rails generate draft:model contact first_name:string last_name:string date_of_birth:date
```

```bash
rails g draft:model company name:string industry:string structure:string last_year_revenue:integer founded_on:date
```

and then don't forget to

```bash
rails db:migrate
```
