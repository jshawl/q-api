# q API

## Local Setup

    $ git clone https://github.com/jshawl/q-api.git
    $ cd q-api
    $ bundle install
    $ rake db:create
    $ rake db:migrate
    $ rails s

## Public API

### `post /users/sign_in`

### `get /groups`

Lists the current users groups, where the current user is defined by
an `authentication_token` query paramater in the url.

### `get /groups/:id`

Returns information about a group identified by its id.

### `get /groups/:group_id/tasks`

Lists all tasks that belong to one group.

### `get /groups/:group_id/tasks/:id`

Lists a specific groups' task.