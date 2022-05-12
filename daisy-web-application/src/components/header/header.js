import CallIcon from '@mui/icons-material/Call';
import { Button, Container, Stack, Typography } from '@mui/material';
import React from "react";
import './header.css';

export default function Header() {

    return (
        <Container style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', height: '200', position: 'fixed', top: 0, boxShadow: '0 4px 22px 0px #E5E3E3', backgroundColor: '#ffffff', width: '100%'}}>
        <Stack spacing={20} direction="row">
            <Stack spacing={5} direction="row" style={{ float: 'left' }}>
                <img src={require('../../assets/images/logo.jpg')} className="headerLogo" />
                <Button href="/categories">
                    <Typography variant="subtitle1" className="headerItemText">Categories</Typography>
                </Button>
                <Button href="/how-it-works">
                    <Typography variant="subtitle1" className="headerItemText">How it works</Typography>
                </Button>
                <Button href="/designers/search">
                    <Typography variant="subtitle1" className="headerItemText">Find a designer</Typography>
                </Button>
                <Button href="/pro/studio">
                    <Typography variant="subtitle1" className="headerItemText">Studio</Typography>
                </Button>
            </Stack>
            <Stack spacing={3} direction="row">
                    <Button href="/contact">
                        <CallIcon style={{color: 'black'}} />
                    <Typography variant="subtitle1" className="headerItemText">1900 9090</Typography>
                </Button>
                <Button href="/login">
                    <Typography variant="subtitle1" className="headerItemText">Login</Typography>
                </Button>
            </Stack>
            </Stack>
            </Container>

    )
}