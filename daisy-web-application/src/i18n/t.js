import i18next from 'i18next';

i18next.init({
  lng: 'en',
  resources: {
    en: {
      translation: {
        404: 'Oops! Page Not Found',

        'login#login_title': 'Sign in',
        'login#signup_title': 'Sign up',

        'intro#title_line01': 'World-class design.',
        'intro#title_line02': 'At your service.',

        'categories#get_started': 'Get Started',

        'intro#description':
          'Daisy designs is the go-to graphic design service by Sode. We make it easy to work with professional, creative experts from around the world and build your brand through custom, memorable design.',

        'trending#title': 'Trending',

        'discovery#designs': 'designs',
        'discovery#connections': 'connections',

        'discovery#getstarted': 'Get started',
        'discovery#joinnow': 'Designers, join now',
        'discovery#customer-review-title':
          '"We wanted something fun and eye-catching that didn’t look like every other coffee logo out there…',
        'discovery#customer-review-description':
          'There were so many designs to choose from and all of the designers were friendly and willing to change things up based on our preferences. In the end, we went with a design from Wintrygrey that we absolutely love. I would definitely recommend 99designs to anyone looking for logos and branding."',
        'discovery#customer-review-name': 'Ngo Lan Vy',
        'discovery#customer-review-major': 'Software engineering student'
      }
    }
  }
});

export default function t(key, params) {
  if (params) {
    return i18next.t(key, params);
  }
  return i18next.t(key);
}
