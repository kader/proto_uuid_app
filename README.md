## A UUID PROTOTYPE

This is a prototype which use uuid datatype with postgresql and rails 4.1.9.

### What is uuid datatype and why we use this?

"A UUID is an identifier that is unique across both space and time, with respect to the space of all UUIDs. Since a UUID is a fixed size and contains a time field, it is possible for values to rollover (around A.D. 3400, depending on the specific algorithm used)."

"Unless you're accepting IDs on, say, an Internet-wide scale, or with an untrusted environment where malicious individuals might be able to do something bad in the case of an ID collision, it's just not something you should worry about."

### Installation
```ruby
rails new proto_uuid_app
```
And change database in Gemfile
```ruby
gem "pg"
```
Run
```ruby
bundle install
```

### How to use uuid type
```ruby
rails g migration enable_uuid_extension
```
```ruby
class EnableUuidExtension < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
  end
end
```
### Use uuid type with your model
```ruby
rails g model user
```
```ruby
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.timestamps
    end
  end
end
```
Now, you can create a user with auto-generated id as a UUID type.

### UUID as a different field

If you want to use uuid as an extra field
```ruby
class AddUuidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uuid, :uuid, default: 'uuid_generate_v4()'
  end
end
```

### Add another model and relate to user model
```ruby
rails g model course
```
```ruby
class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses, id: :uuid do |t|
      t.string :name
      t.uuid :user_id
      t.timestamps
    end
  end
end
```
Be sure that, user_id field of course is uuid type because a user's id is also uuid type.

### Also, you want to look at:
* http://www.postgresql.org/docs/9.4/static/uuid-ossp.html
* http://andrzejonsoftware.blogspot.com.tr/2013/12/decentralise-id-generation.html
* https://github.com/rails/rails/blob/master/activerecord/lib/active_record/connection_adapters/postgresql_adapter.rb#L338-L342
* http://en.wikipedia.org/wiki/Universally_unique_identifier#Random%5FUUID%5Fprobability%5Fof%5Fduplicates