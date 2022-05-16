import { Container, Typography } from '@mui/material';
import t from '../../i18n/t';

export default function Trending() {
  return (
    <Container>
      <Typography style={{ fontFamily: 'OpenSans-Bold', fontSize: '20px' }}>
        {t('trending#title')}
      </Typography>
    </Container>
  );
}
