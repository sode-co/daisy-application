import { Button, Stack, Typography } from '@mui/material';
import React from "react";
import './header.css';

export default function Header() {

    return (
        <Stack spacing={15} direction="row" style={{ position: 'fixed', top: 0, boxShadow: '0 1px 0px #ECE9E8' }}>
            <Stack spacing={1} direction="row" style={{ float: 'left' }}>
                <img src={require('../../assets/images/app_logo.avif')} className="headerLogo" />
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
            <Stack spacing={1} direction="row" style={{ float: 'right' }}>
                <Button href="/contact">
                    <Typography variant="subtitle1" className="headerItemText">Contact</Typography>
                </Button>
                <Button href="/login">
                    <Typography variant="subtitle1" className="headerItemText">Login</Typography>
                </Button>
            </Stack>
        </Stack>
    )
}