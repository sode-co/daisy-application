import { Box, Container } from '@mui/material';
import React from 'react';
import Header from '../../components/header';
import Categories from '../categories';
import './landingPage.css';

export default function LandingPage() {
  return (
    <Container style={{ width: '100%' }}>
      <Header />
      <Box className="bodyContainer">
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
        <Categories />
        <Categories />
      </Box>
    </Container>
  );
}
