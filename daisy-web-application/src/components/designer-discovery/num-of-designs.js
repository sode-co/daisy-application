import { Box, Typography } from '@mui/material';
import colors from '../../constants/colors';
import './index.css';

export default function NumOfDesigns() {
  const { orange } = colors;

  return (
    <Box class="bg">
      <Typography class="subtitle" style={{ fontWeight: 'bold' }}>
        Get this: A new design is created on 99designs every 2 seconds!
      </Typography>
      <Typography variant="h3" style={{ color: orange }}>
        97,339,726 designs
      </Typography>
    </Box>
  );
}
