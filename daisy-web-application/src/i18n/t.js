import i18next from 'i18next';

i18next.init({
  lng: 'en',
  resources: {
    en: {
      translation: {
        404: 'Oops! Page Not Found',

        'login#login_title': 'Sign in',
        'login#signup_title': 'Sign up',
      },
    },
  },
});

export default function t(key, params) {
  if (params) {
    return i18next.t(key, params);
  }
  return i18next.t(key);
}
