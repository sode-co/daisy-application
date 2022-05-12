import { Container } from '@mui/material';
import React from 'react';
import './banner.css';
import LeftBanner from './leftItem';
import RightBanner from './rightItem';

export default function Banner() {
  return (
    <Container
      style={{
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        backgroundColor: '#ffffff',
        width: '100%'
      }}>
      <LeftBanner />
      <RightBanner />
    </Container>
  );
}
