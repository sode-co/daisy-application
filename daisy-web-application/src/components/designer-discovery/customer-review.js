import { Box, Button, Stack, Typography } from '@mui/material';
import { NavLink } from 'react-router-dom';
import colors from '../../constants/colors';
import t from '../../i18n/t';
import './index.css';

export default function CustomerReview() {
  const { white } = colors;

  return (
    <Box class="bg">
      <Stack spacing={6} direction="row">
        <Box width="250px" />
        <Box>
          <Stack spacing={2} direction="row">
            <Box>
              <img
                src={require('../../assets/images/discovery-designer/studentfpt.jpg')}
                height="200px"
              />
              <img
                src={require('../../assets/images/discovery-designer/fptstudent.webp')}
                style={{ paddingTop: '20px' }}
              />
            </Box>
          </Stack>
        </Box>
        <Box style={{ textAlign: 'left', marginTop: '50px' }}>
          <Box>
            <Typography class="subtitle2" style={{ fontSize: '25px', fontWeight: 'bold' }}>
              {t('discovery#customer-review-title')}
            </Typography>
            <Typography variant="string" style={{ color: 'black' }}>
              {t('discovery#customer-review-description')}
            </Typography>
            <Box>
              <Stack spacing={2} direction="row" style={{ marginTop: '10px' }}>
                <Box>
                  <img
                    src={require('../../assets/images/discovery-designer/avatar.webp')}
                    className="headerLogo"
                  />
                </Box>
                <Box style={{ marginTop: '10px' }}>
                  <Typography variant="subtitle2">{t('discovery#customer-review-name')}</Typography>
                  <Typography variant="strings">{t('discovery#customer-review-major')}</Typography>
                </Box>
              </Stack>
            </Box>
          </Box>
        </Box>

        <Stack
          spacing={6}
          direction="row"
          style={{ justifyContent: 'center', position: 'absolute', bottom: '25px', left: '35%' }}>
          <Button
            size="large"
            variant="contained"
            style={{ textDecoration: 'lowercase', backgroundColor: 'black', height: '60px' }}>
            <NavLink to="/categories" class="link" style={{ textDecoration: 'none' }}>
              <Typography
                variant="subtitle2"
                style={{ color: white, textTransform: 'none', fontSize: '20px' }}>
                {t('discovery#getstarted')}
              </Typography>
            </NavLink>
          </Button>
          <Button
            size="large"
            variant="outlined"
            style={{ borderColor: 'black', borderWidth: 1.5 }}>
            <NavLink to="/login" class="link" style={{ textDecoration: 'none' }}>
              <Typography
                variant="subtitle2"
                style={{ color: 'black', textTransform: 'none', fontSize: '20px' }}>
                {t('discovery#joinnow')}
              </Typography>
            </NavLink>
          </Button>
        </Stack>
        <Box width="250px" />
      </Stack>
    </Box>
  );
}
