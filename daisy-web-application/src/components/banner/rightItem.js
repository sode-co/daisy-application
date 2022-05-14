import { Container, Typography } from '@mui/material';
import React from 'react';
import green from '../../constants/colors';
import t from '../../i18n/t';
import CategoriesComboBox from '../categories/input-auto-complete';
import './banner.css';

export default function RightBanner() {
  return (
    <Container>
      <Typography variant="h3" style={{ color: green }}>
        {' '}
        {t('intro#title_line01')}
      </Typography>
      <Typography variant="h3" style={{ color: green }}>
        {t('intro#title_line02')}
      </Typography>
      <hr
        style={{
          height: '4px',
          width: '50px',
          border: 'none',
          color: green,
          backgroundColor: green,
          marginLeft: '0px'
        }}
      />
      <Typography variant="subtitle1">{t('intro#description')}</Typography>
      <br />
      <CategoriesComboBox />
    </Container>
  );
}
