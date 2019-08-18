# Chat-App
> Your favorite messaging app

The chat app has the basic functionality but it needs a lot of improvements as listed in the end of the readme.

### Installation

```shell
$ cp config/database.yml.example  config/database.yml
```
Then setup the database credentials in the `database.yml` file [username, password]

### Run Development

__Docker__
```shell
$ docker-compose up --build
# This should be run after the prev step
$ docker-compose run app rails db:setup
```

__How to use__

The app exposes these endpoints at the base endpoint ```localhsot:3000/```:

- Application

| Description | Endpoint| Parameter | Type
| :--- | :--- | :--- | :---
| Create new application | ```POST /applications ``` | `name` | `string` |
| List all applications | ```GET /applications ```
| Show an application | ```GET /applications/:app_token ```
| Delete an application | ```DEL /applications/:app_token ```


- Chat

| Description | Endpoint| Parameter | Type
| :--- | :--- | :--- | :---
| Create new chat | ```POST applications/:app_token/chats```
| List all chats | ```GET applications/:app_token/chats ```
| Show a chat | ```GET applications/:app_token/chats/:chat_number ```
| Delete a chat | ```DEL applications/:app_token/chats/:chat_number ```


- Message

| Description | Endpoint| Parameter | Type
| :--- | :--- | :--- | :---
| Create new message | ```POST /applications/:app_token/chats/:chat_number/messages``` | `body` | `text` |
| List all messages | ```GET /applications/:app_token/chats/:chat_number/messages```
| Show a message | ```GET /applications/:app_token/chats/:chat_number/messages/:message_number```
| Delete a message | ```DEL /applications/:app_token/chats/:chat_number/messages/:message_number```


- To search in message's bodies
```http
GET /search_messages?query=
```

### List of enhancements
- Propagate the deletion of the app and messages
- Add GO service for creation
- Add unit tests
- Paginate listing
- Enhance messages searching