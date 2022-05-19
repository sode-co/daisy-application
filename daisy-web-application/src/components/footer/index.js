import React from 'react';
import './footer.css';
import { Link, Grid, Container, Typography } from '@mui/material';
import { Box } from '@mui/system';
import { Divider } from '@mui/material';
import FacebookIcon from '@mui/icons-material/Facebook';
import InstagramIcon from '@mui/icons-material/Instagram';
import TwitterIcon from '@mui/icons-material/Twitter';
import PinterestIcon from '@mui/icons-material/Pinterest';

function Footer() {
  return (
    <footer maxWidth="xl">
      <Box bgcolor="#f3f2f0" px={5} py={5}>
        <Divider sx={{ borderBottomWidth: 2 }}></Divider>
        <Container
          maxWidth="lg"
          spacing={4}
          style={{
            display: 'flex',
            justifyContent: 'center'
          }}>
          <Grid item margin={9} xs={12} sm={4}>
            <Box py={1}>
              <Typography variant="subtitle2">Company</Typography>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                About
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Contact
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Careers
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Teams
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Press Releases
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                In the media
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Testimonials
              </Link>
            </Box>
          </Grid>
          <Grid item margin={9} xs={12} sm={4}>
            <Box py={1}>
              <Typography variant="subtitle2">Design services</Typography>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                1-to-1 Projects
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Find a designer
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Pricing
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Agencies
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Brand guide
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Discover inspiration
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Job marketplace
              </Link>
            </Box>
          </Grid>
          <Grid item margin={9} xs={12} sm={4}>
            <Box py={1}>
              <Typography variant="subtitle2">Get a design</Typography>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Logo design
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Business card
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Web design
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Mobile design
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Product design
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                T-shirt design
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Cover design
              </Link>
            </Box>
          </Grid>
          <Grid item margin={9} xs={12} sm={4}>
            <Box py={1}>
              <Typography variant="subtitle2">Resources</Typography>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Become a designer
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Security alert
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Logo ideas
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                T-shirt ideas
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Designer resources
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Our partner
              </Link>
            </Box>
            <Box py={1}>
              <Link style={{ textDecoration: 'none' }} color="#313030" variant="body2" href="/">
                Help center
              </Link>
            </Box>
          </Grid>
        </Container>
        <Divider sx={{ borderBottomWidth: 2 }}></Divider>
        <Box
          bgcolor="#f3f2f0"
          marginTop={3}
          style={{
            display: 'flex',
            justifyContent: 'start'
          }}>
          <Grid>
            <Typography color="#313030" marginRight={2} variant="body2">
              ©Daisy
            </Typography>
          </Grid>
          <Grid>
            <Link
              href="/"
              marginRight={2}
              color="#313030"
              variant="body2"
              style={{ textDecoration: 'none' }}>
              Terms
            </Link>
          </Grid>
          <Grid>
            <Link
              href="/"
              marginRight={2}
              color="#313030"
              variant="body2"
              style={{ textDecoration: 'none' }}>
              Privacy
            </Link>
          </Grid>
          <Grid>
            <Link
              href="/"
              marginRight={2}
              color="#313030"
              variant="body2"
              style={{ textDecoration: 'none' }}>
              English
            </Link>
          </Grid>
          <Grid>
            <Link
              href="/"
              marginRight={2}
              color="#313030"
              variant="body2"
              style={{ textDecoration: 'none' }}>
              Tiếng Việt
            </Link>
          </Grid>
        </Box>
        <Box
          bgcolor="#f3f2f0"
          marginTop={-3}
          style={{
            display: 'flex',
            justifyContent: 'end'
          }}>
          <Grid marginRight={1}>
            <FacebookIcon style={{ color: 'black' }} />
          </Grid>
          <Grid marginRight={1}>
            <TwitterIcon style={{ color: 'black' }} />
          </Grid>
          <Grid marginRight={1}>
            <InstagramIcon style={{ color: 'black' }} />
          </Grid>
          <Grid marginRight={1}>
            <PinterestIcon style={{ color: 'black' }} />
          </Grid>
        </Box>
      </Box>
    </footer>
  );
}

export default Footer;
