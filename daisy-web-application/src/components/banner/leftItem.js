import { Container } from '@mui/material';
import SimpleImageSlider from 'react-simple-image-slider';
import colors from '../../constants/colors';

const images = [
  { url: require('../../assets/images/banner/packaging.avif') },
  { url: require('../../assets/images/banner/logo.avif') },
  { url: require('../../assets/images/banner/poster.avif') },
  { url: require('../../assets/images/banner/tshirt.avif') },
  { url: require('../../assets/images/banner/branding.avif') }
];

export default function LeftBanner() {
  const { white } = colors;

  return (
    <Container>
      <SimpleImageSlider
        width={467}
        height={450}
        images={images}
        showBullets={true}
        showNavs={true}
        bgColor={white}
      />
    </Container>
  );
}
