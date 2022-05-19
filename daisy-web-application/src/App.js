// import { t } from "./i18n/t";
import { createTheme, ThemeProvider } from '@mui/material/styles';
import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Discovery from './components/designer-discovery/index';
import Error404 from './pages/404error';
import Categories from './pages/categories';
import FindADesigner from './pages/find-a-design';
import HowItWorks from './pages/how-it-works';
import LandingPage from './pages/landing';
import { default as Contact, default as Login } from './pages/login';
import Studio from './pages/studio';

function App() {
  const THEME = createTheme({
    typography: {
      h1: {
        fontFamily: 'OpenSans-Bold',
        fontSize: 90,
        fontWeight: 900
      },
      h3: {
        fontFamily: 'OpenSans-Bold',
        fontSize: 50,
        fontWeight: 600
      },
      subtitle1: {
        fontFamily: 'OpenSans-Light',
        fontSize: 14,
        fontWeight: 600
      },
      subtitle2: {
        fontFamily: 'OpenSans-Bold',
        fontSize: 14,
        fontWeight: 500
      },
      string: {
        fontFamily: 'OpenSans-Light',
        fontSize: 14,
        fontWeight: 400
      }
    }
  });
  // const isAuth = false;
  return (
    <ThemeProvider theme={THEME}>
      <Router>
        <div>
          <Routes>
            {/* {isAuth && <Route path="/login" element={<Login />} />} */}
            <Route path="/login" element={<Login />} />
            <Route path="/abc" element={<LandingPage />} />
            <Route path="/categories" element={<Categories />} />
            <Route path="/how-it-works" element={<HowItWorks />} />
            <Route path="/designers/search" element={<FindADesigner />} />
            <Route path="/pro/studio" element={<Studio />} />
            <Route path="/contact" element={<Contact />} />
            <Route path="/discovery" element={<Discovery />} />
            <Route path="*" element={<Error404 />} />
          </Routes>
        </div>
      </Router>
    </ThemeProvider>
  );
}

export default App;
