# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Shadone is a Ruby on Rails web application for language learners to practice shadowing exercises with YouTube videos. The app allows users to loop YouTube videos, set repetition counts, and automatically track practice hours.

**Tech Stack:**
- Ruby 3.0.3
- Rails 6.1.7.2
- Vue.js 2.6.14 (frontend)
- PostgreSQL (database)
- Webpacker 5.x (asset pipeline)
- TailwindCSS + DaisyUI (styling)

## Development Commands

### Setup and Installation
```bash
bin/setup          # Full project setup (installs gems, yarn packages, prepares DB)
foreman start      # Start development server
```

### Testing
```bash
bundle exec rspec  # Run Ruby/Rails tests
bin/yarn test      # Run JavaScript/Vue tests (Jest)
```

### Linting
```bash
bin/lint           # Run all linters (standardrb, slim-lint, eslint)
bundle exec standardrb  # Ruby linting only
bin/yarn lint      # JavaScript linting only
```

### Database
```bash
bin/rails db:prepare  # Setup/reset database
bin/rails db:migrate  # Run migrations
```

## Architecture

### Backend (Rails)
- **Models**: `User` (OAuth via Google), `PracticeLog` (tracks daily practice)
- **Controllers**: Standard Rails controllers + API namespace for JSON endpoints
- **Authentication**: Google OAuth2 via omniauth
- **Key Features**: Practice log tracking, duration calculations, user management

### Frontend (Vue.js)
- **Main Components**:
  - `after-login-main.vue`: Main app container
  - `youtube-loop.vue`: YouTube video player with looping controls
  - `practice-calendar.vue`: Calendar view of practice logs
  - `video-modal.vue`: Modal for video interactions
- **Mixins**: `practice-log-fetchable.js` for API calls
- **Entry Point**: `app/javascript/packs/application.js`

### Key Directories
- `app/javascript/`: Vue.js components and frontend logic
- `app/models/`: Rails models (User, PracticeLog)
- `app/controllers/api/`: JSON API endpoints
- `spec/`: Tests (RSpec for Ruby, Jest for JavaScript)
- `config/webpack/`: Webpacker configuration for Vue.js

### Data Flow
1. User authenticates via Google OAuth
2. YouTube videos are embedded and controlled via Vue components
3. Practice sessions create PracticeLog records via API
4. Calendar component displays practice history
5. Total practice duration calculated from all logs

## Environment Variables Required
- `GOOGLE_CLIENT_ID`: Google OAuth client ID
- `GOOGLE_CLIENT_SECRET`: Google OAuth client secret

## Notes
- Uses Slim templates for views
- JavaScript tests are in `spec/javascripts/`
- Ruby tests follow standard RSpec structure
- Frontend uses Vue 2.x with Composition API plugin
- TailwindCSS with DaisyUI component library for styling