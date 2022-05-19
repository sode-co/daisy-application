import { Container } from '@mui/material';
import React from 'react';
import colors from '../../constants/colors';
import './banner.css';
import LeftBanner from './leftItem';
import RightBanner from './rightItem';

export default function Banner() {
  const { white } = colors;
  return (
    <Container
      style={{
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        backgroundColor: white,
        width: '100%'
      }}>
      <LeftBanner />
      <RightBanner />
    </Container>
  );
}
