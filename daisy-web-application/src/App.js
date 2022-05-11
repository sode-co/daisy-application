// import { t } from "./i18n/t";
import { createTheme, ThemeProvider } from '@mui/material/styles';
import React from 'react';
import {
  BrowserRouter as Router, Route, Routes
} from "react-router-dom";
import Categories from './pages/Categories';
import Error404 from './pages/Error404';
import FindADesigner from './pages/FindADesigner';
import HowItWorks from './pages/HowItWorks';
import LandingPage from './pages/LandingPage';
import { default as Contact, default as Login } from './pages/Login';
import Studio from './pages/Studio';

function App() {
    const THEME = createTheme({
      typography: {
        subtitle1: {
          "fontFamily": "OpenSans-Light",
          fontSize: 14,
          fontWeight: 600
        },
        subtitle2: {
          "fontFamily": "OpenSans-Light",
          fontSize: 14,
          fontWeight: 500
        },
        string: {
          "fontFamily": "OpenSans-Light",
          fontSize: 14,
          fontWeight: 400
        },
      }
  });
  const isAuth = false;
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
          <Route path="*" element={<Error404 />} />
        </Routes>
      </div>
      </Router>
      </ThemeProvider>
  );
}

export default App;
