const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      keyframes: {
        sidein: {
          '0%': { transform: 'translateX(100%)' , opacity:'0' },
          '100%': { transform: 'translateX(0%)',  opacity:'1' },
        },
        sideout: {
          '100%': { transform: 'translateX(100%)',  opacity:'0.3' },
          '0%': { transform: 'translateX(0%)'  },
        }
      },
      animation: {
        sidein: 'sidein .6s ease-in-out',
        sideout: 'sideout .6s ease-in-out',
      },
      colors: {
          'Azure-blue-6': '#34406D',
          'Azure-blue': '#414E92',
          'Azure-blue-5': '#6871B1',
          'Azure-blue-4': '#5965A3',
          'Azure-blue-3': '#E3E9E9',
          'Azure-blue-2': '#2B2625',
          'Azure-blue-1': '#4F4644',
          'my-blue': '#2196f3',
          'white-1':'#FFFFFF',
          'white-2':'#CCCCCC',
          'white-3':'#F7F7F7',
          'orange-1':'#FFA500',
          'orange-2':'#E25B34',
          'text-1':'#C7462D'
      },
      boxShadow: {
        '3xl': 'rgba(67, 71, 85, 0.27) 0px 0px 0.25em, rgba(90, 125, 188, 0.05) 0px 0.25em 1em',
        '4xl': 'rgb(38, 57, 77) -20px 20px 30px 0px',
        '5xl': 'rgba(0, 0, 0, 0.16) 0px 1px 4px'
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require("daisyui"),
    
  ],
  daisyui: {
    styled: true,
    themes: true,
    base: true,
    utils: true,
    logs: true,
    rtl: false,
    prefix: "",
    darkTheme: "light",
  },  
}
