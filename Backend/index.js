const express = require('express');
const cors = require('cors');
const jogadorRoutes = require('./src/routes/jogadorRoutes');

const app = express();
app.use(cors());
app.use(express.json());

// Rotas
app.use('/api', jogadorRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});