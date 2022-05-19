import { Carousel } from 'react-responsive-carousel';
import 'react-responsive-carousel/lib/styles/carousel.min.css'; // requires a loader
import CustomerReview from './customer-review';
import NumOfConnections from './num-of-connections';
import NumOfDesigns from './num-of-designs';

export default function Discovery() {
  return (
    <Carousel>
      <div>
        <NumOfDesigns />
      </div>
      <div>
        <CustomerReview />
      </div>
      <div>
        <NumOfConnections />
      </div>
    </Carousel>
  );
}
