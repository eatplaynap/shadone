module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.slim',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/javascript/**/*.vue',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    colors: {
      'base': '#FFF',
      'main': '#29292c',
      'accent': '#e03131',
      'sub': '#f0f0f8',
      'neutral': '#d2d2d8',
      'gray' : '#4b5563'
    },
    extend: {
      width: {
        '1/7': '14.2857143%',
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/typography'),
    require("daisyui")],
  daisyui: {
    themes: [
      {
      shadone: {
      'base': '#FFF',
      'main': '#29292c',
      'accent': '#e03131',
      'sub': '#f0f0f8',
      'neutral': '#d2d2d8',
      'success': '#75E1D6',
      'secondary' : '#d3d3d9',
      }
      }, "bumblebee"],
  },
}
