
const express = require('express');

const app = express();

// Middleware to parse incoming JSON requests
app.use(express.json());

// Basic health-check endpoint
app.get('/api/health', (req, res) => {
  res.status(200).json({
    success: true,
    message: 'Medaris API is running!',
  });
});

module.exports = app;
