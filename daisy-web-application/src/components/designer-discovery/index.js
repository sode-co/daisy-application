import { Typography } from '@mui/material';
import { Carousel } from 'react-responsive-carousel';
import 'react-responsive-carousel/lib/styles/carousel.min.css'; // requires a loader
import NumOfDesigns from './num-of-designs';

export default function Discovery() {
  return (
    <Carousel>
      <div>
        <NumOfDesigns />
      </div>
      <div>
        <Item02 />
      </div>
      <div>
        <Item03 />
      </div>
    </Carousel>
  );
}

function Item02() {
  return <Typography>item02</Typography>;
}

function Item03() {
  return <Typography>item03</Typography>;
}
