import { Container, ImageList, ImageListItem, ImageListItemBar, Typography } from '@mui/material';
import t from '../../i18n/t';
import './trending.css';

export default function Trending() {
  const itemData = [
    {
      img: require('../../assets/images/trending/logo-website-squarespace.avif'),
      title: 'Logo & Website'
    },
    {
      img: require('../../assets/images/trending/web-design.avif'),
      title: 'Web Design'
    },
    {
      img: require('../../assets/images/trending/branding-design.avif'),
      title: 'Brand identity'
    },
    {
      img: require('../../assets/images/trending/product-packaging-design.avif'),
      title: 'Product Packaging'
    },
    {
      img: require('../../assets/images/trending/illustrations.avif'),
      title: 'Illustration'
    },
    {
      img: require('../../assets/images/trending/book-cover-design.avif'),
      title: 'Book Cover'
    },
    {
      img: require('../../assets/images/trending/t-shirt-design.avif'),
      title: 'T-shirt'
    },
    {
      img: require('../../assets/images/trending/categories.avif'),
      title: 'Show more'
    }
  ];

  return (
    <Container>
      <Typography style={{ fontFamily: 'OpenSans-Bold', fontSize: '20px' }}>
        {t('trending#title')}
      </Typography>
      <ImageList sx={{ width: '100%', height: '100%' }} cols={8}>
        {itemData.map((item) => (
          <ImageListItem key={item.img} className="imageItem">
            <img src={`${item.img}`} srcSet={`${item.img}`} alt={item.title} loading="lazy" />
            <ImageListItemBar title={item.title} position="below" />
          </ImageListItem>
        ))}
      </ImageList>
    </Container>
  );
}
