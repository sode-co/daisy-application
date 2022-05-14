import SearchIcon from '@mui/icons-material/Search';
import { Button, Grid, Typography } from '@mui/material';
import Autocomplete from '@mui/material/Autocomplete';
import TextField from '@mui/material/TextField';
import * as React from 'react';
import { default as gray, default as green } from '../../constants/colors';
import t from '../../i18n/t';

const categories = [
  {
    label: 'Logo & identity'
  },
  {
    label: 'Web & app design'
  },
  {
    label: 'Business & advertising'
  },
  {
    label: 'Clothing & merchandising'
  },
  {
    label: 'Art & illustration'
  },
  {
    label: 'Packaging & label'
  },
  {
    label: 'Book & magazine'
  }
];

export default function CategoriesComboBox() {
  return (
    <Grid container>
      <Grid item xs={8}>
        <Autocomplete
          disablePortal
          id="combo-box"
          options={categories}
          sx={{ width: 300 }}
          renderInput={(params) => <TextField {...params} label="Category" />}
          popupIcon={<SearchIcon />}
          forcePopupIcon={true}
          style={{ borderColor: gray, borderWidth: 'thick' }}
        />
      </Grid>
      <Grid item xs={4}>
        <Button style={{ backgroundColor: green, height: '56px', width: '130px' }}>
          <Typography
            style={{
              color: 'white',
              textTransform: 'none',
              fontFamily: 'OpenSans-Bold',
              fontSize: '18px'
            }}>
            {t('categories#get_started')}
          </Typography>
        </Button>
      </Grid>
    </Grid>
  );
}
