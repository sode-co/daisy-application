import CallIcon from '@mui/icons-material/Call';
import { Button, Container, Stack, Typography } from '@mui/material';
import React from 'react';
import white from '../../constants/colors';
import './header.css';

export default function Header() {
  return (
    <Container
      style={{
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        height: '200',
        position: 'fixed',
        top: 0,
        boxShadow: '0 4px 22px 0px #E5E3E3',
        backgroundColor: white,
        width: '3000px',
        zIndex: 1
      }}
      className="headerContainer"
      maxWidth={false}>
      <Stack spacing={20} direction="row">
        <Stack spacing={5} direction="row" style={{ float: 'left' }}>
          <img src={require('../../assets/images/daisylogo.png')} className="headerLogo" />
          <Button href="/categories">
            <Typography variant="subtitle2" className="headerItemText">
              Categories
            </Typography>
          </Button>
          <Button href="/how-it-works">
            <Typography variant="subtitle2" className="headerItemText">
              How it works
            </Typography>
          </Button>
          <Button href="/designers/search">
            <Typography variant="subtitle2" className="headerItemText">
              Find a designer
            </Typography>
          </Button>
          <Button href="/pro/studio">
            <Typography variant="subtitle2" className="headerItemText">
              Studio
            </Typography>
          </Button>
        </Stack>
        <Stack spacing={9} direction="row">
          <Button href="/contact">
            <CallIcon style={{ color: 'black' }} />
            <Typography variant="subtitle2" className="headerItemText">
              1900 9090
            </Typography>
          </Button>
          <Button href="/login">
            <Typography variant="subtitle2" className="headerItemText">
              Login
            </Typography>
          </Button>
        </Stack>
      </Stack>
    </Container>
  );
}
