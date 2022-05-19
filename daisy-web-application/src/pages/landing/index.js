import { Box } from '@mui/material';
import React from 'react';
import Banner from '../../components/banner';
import Header from '../../components/header';
import Categories from '../categories';
import './landingPage.css';
import Footer from '../../components/footer';

export default function LandingPage() {
  return (
    <React.Fragment style={{ width: '100%' }}>
      <Header />
      <Box className="bodyContainer">
        <Banner />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Footer />
      </Box>
    </React.Fragment>
  );
}
