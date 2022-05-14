import { Container, Typography } from '@mui/material';
import React from 'react';
import t from '../../i18n/t';
import './banner.css';

export default function RightBanner() {
  return (
    <Container>
      <Typography variant="h3"> {t('intro#title_line01')}</Typography>
      <Typography variant="h3">{t('intro#title_line02')}</Typography>
      <hr
        style={{
          height: '4px',
          width: '50px',
          border: 'none',
          color: '#333',
          backgroundColor: '#333',
          marginLeft: '0px'
        }}
      />
      <Typography variant="subtitle1">{t('intro#description')}</Typography>
    </Container>
  );
}
