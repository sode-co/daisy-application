import { Box, Button, Stack, Typography } from '@mui/material';
import { NavLink } from 'react-router-dom';
import colors from '../../constants/colors';
import t from '../../i18n/t';
import './index.css';

export default function NumOfConnections() {
  const { red, white } = colors;

  return (
    <Box class="bg">
      <Box>
        <Typography class="subtitle2" style={{ fontSize: '25px', fontWeight: 'bold' }}>
          Collaboration is the key to creativity, and we love bringing people together.
        </Typography>
        <Typography variant="h1" style={{ color: red }}>
          {`697,884 ${t('discovery#connections')}`}
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
            style={{ textDecoration: 'lowercase', backgroundColor: red, height: '60px' }}>
            <NavLink to="/categories" class="link" style={{ textDecoration: 'none' }}>
              <Typography
                variant="subtitle2"
                style={{ color: white, textTransform: 'none', fontSize: '20px' }}>
                {t('discovery#getstarted')}
              </Typography>
            </NavLink>
          </Button>
          <Button size="large" variant="outlined" style={{ borderColor: red, borderWidth: 1.5 }}>
            <NavLink to="/login" class="link" style={{ textDecoration: 'none' }}>
              <Typography
                variant="subtitle2"
                style={{ color: red, textTransform: 'none', fontSize: '20px' }}>
                {t('discovery#joinnow')}
              </Typography>
            </NavLink>
          </Button>
        </Stack>
      </Box>
    </Box>
  );
}
