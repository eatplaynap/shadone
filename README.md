# Shadone

Shadone is a web app for language learners who want to do shadowing exercise with YouTube videos.

## Features
With Shadone you can

- Repeat full or a part of YouTube video
- Set loop how many times you want
- Automatically record your practice hours ( per a day + total )

## Developed With
- Ruby 3.0.3
- Rails  6.1.7.2
- Vue.js 2.6.14

## How to use
### Setting Environment Variables

| Name | Description |
| :-: | :-: |
| GOOGLE_CLIENT_ID | google client id |
| GOOGLE_CLIENT_SECRET | google client secret |

### Installation
```bash
$ bin/setup
$ foreman start
```

### Testing / Lint
```bash
$ bundle exec rspec
$ bin/lint
```

### Screen Shots
### YouTube Loop
#### Before Starting Loop
![image](https://user-images.githubusercontent.com/63531341/189540781-dedeb147-c244-4e03-baa4-13cfcbb7bee8.png)

#### Middle of Loop
![image](https://user-images.githubusercontent.com/63531341/189540827-7dafa32e-03f0-4697-9a5b-c4a720e60744.png)

#### After Finishing Loop
![image](https://user-images.githubusercontent.com/63531341/189540878-f6a6bec2-cc4b-4fd5-b53d-51eb59f9c52e.png)

### Calendar
![image](https://user-images.githubusercontent.com/63531341/182334093-4bf9499f-48e5-4fbe-a69b-6c25cbc76f5a.png)

### Edit Practice Log
![image](https://user-images.githubusercontent.com/63531341/189540973-e6797cb2-a037-4e08-84fd-91e1d5793d70.png)
