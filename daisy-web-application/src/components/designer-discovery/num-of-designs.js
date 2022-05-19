import { Box, Button, Stack, Typography } from '@mui/material';
import { NavLink } from 'react-router-dom';
import colors from '../../constants/colors';
import t from '../../i18n/t';
import './index.css';

export default function NumOfDesigns() {
  const { orange, white } = colors;

  return (
    <Box class="bg">
      <Box>
        <Typography class="subtitle2" style={{ fontSize: '25px', fontWeight: 'bold' }}>
          Get this: A new design is created on 99designs every 2 seconds!
        </Typography>
        <Typography variant="h1" style={{ color: orange }}>
          {`97,339,726 ${t('discovery#designs')}`}
        </Typography>
        <br />
        <br />
        <br />

        <Stack
          spacing={6}
          direction="row"
          style={{ justifyContent: 'center', position: 'absolute', bottom: '25px', left: '38%' }}>
          <Button
            size="large"
            variant="contained"
            style={{ textDecoration: 'lowercase', backgroundColor: orange, height: '60px' }}>
            <NavLink to="/categories" class="link" style={{ textDecoration: 'none' }}>
              <Typography
                variant="subtitle2"
                style={{ color: white, textTransform: 'none', fontSize: '20px' }}>
                {t('discovery#getstarted')}
              </Typography>
            </NavLink>
          </Button>
          <Button size="large" variant="outlined" style={{ borderColor: orange, borderWidth: 1.5 }}>
            <NavLink to="/login" class="link" style={{ textDecoration: 'none' }}>
              <Typography
                variant="subtitle2"
                style={{ color: orange, textTransform: 'none', fontSize: '20px' }}>
                {t('discovery#joinnow')}
              </Typography>
            </NavLink>
          </Button>
        </Stack>
      </Box>
    </Box>
  );
}
