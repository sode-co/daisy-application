import { Typography } from '@mui/material';
import { Carousel } from 'react-responsive-carousel';
import 'react-responsive-carousel/lib/styles/carousel.min.css'; // requires a loader\
export default function Discovery() {
  return (
    <Carousel>
      <div>
        <Item01 />
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

function Item01() {
  return <Typography>item01</Typography>;
}

function Item02() {
  return <Typography>item02</Typography>;
}

function Item03() {
  return <Typography>item03</Typography>;
}
