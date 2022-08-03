# Shadone

Shadone is a web app for language learners who want to do shadowing exercise with YouTube videos.

## Features
With ShaDone you can

- Repeat full or a part of YouTube video
- Set loop how many times you want
- Automatically record your practice hours ( per a day + total )

## Developed With
- Ruby 3.0.3
- Rails  6.1.5.1
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
![image](https://user-images.githubusercontent.com/63531341/182333029-4e7c2379-f939-4cb2-8229-7961154e3106.png)

#### Middle of Loop
![image](https://user-images.githubusercontent.com/63531341/182333393-9be999fe-df58-4a4a-a43f-817a46a082a5.png)

#### After Finishing Loop
![image](https://user-images.githubusercontent.com/63531341/182333699-184ee9bc-45c1-494d-acea-d162eae45e45.png)


### Calendar
![image](https://user-images.githubusercontent.com/63531341/182334093-4bf9499f-48e5-4fbe-a69b-6c25cbc76f5a.png)
### Edit Practice Log
![image](https://user-images.githubusercontent.com/63531341/182334397-792bf752-9d62-437b-858f-4ab950efe4ce.png)
