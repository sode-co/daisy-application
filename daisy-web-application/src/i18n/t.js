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
        'intro#description':
          'Daisy designs is the go-to graphic design service by Sode. We make it easy to work with professional, creative experts from around the world and build your brand through custom, memorable design.'
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
