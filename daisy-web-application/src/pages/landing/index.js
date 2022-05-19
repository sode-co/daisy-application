import { Box } from '@mui/material';
import React from 'react';
import Banner from '../../components/banner';
import Discovery from '../../components/designer-discovery';
import Header from '../../components/header';
import Trending from '../../components/trending';
import Categories from '../categories';
import './landingPage.css';

export default function LandingPage() {
  return (
    <React.Fragment>
      <Header />
      <Box className="bodyContainer">
        <Banner />
        <Trending />
        <Discovery />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
        <Categories />
      </Box>
    </React.Fragment>
  );
}
