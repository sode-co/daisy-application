import { Container } from '@mui/material';
import SimpleImageSlider from 'react-simple-image-slider';
const images = [
  { url: require('../../assets/images/banner/packaging.avif') },
  { url: require('../../assets/images/banner/logo.avif') },
  { url: require('../../assets/images/banner/poster.avif') },
  { url: require('../../assets/images/banner/tshirt.avif') },
  { url: require('../../assets/images/banner/branding.avif') }
];

export default function LeftBanner() {
  return (
    <Container>
      <SimpleImageSlider
        width={467}
        height={450}
        images={images}
        showBullets={true}
        showNavs={true}
        bgColor={'#ffffff'}
      />
    </Container>
  );
}
