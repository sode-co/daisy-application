import { Container, Typography } from '@mui/material';
import React from 'react';
import t from '../../i18n/t';
import CategoriesComboBox from '../categories/autoCompleteInput';
import './banner.css';
export default function RightBanner() {
  return (
    <Container>
      <Typography variant="h3" style={{ color: '#009697' }}>
        {' '}
        {t('intro#title_line01')}
      </Typography>
      <Typography variant="h3" style={{ color: '#009697' }}>
        {t('intro#title_line02')}
      </Typography>
      <hr
        style={{
          height: '4px',
          width: '50px',
          border: 'none',
          color: '#009697',
          backgroundColor: '#009697',
          marginLeft: '0px'
        }}
      />
      <Typography variant="subtitle1">{t('intro#description')}</Typography>
      <br />
      <CategoriesComboBox />
    </Container>
  );
}
