const express = require('express');
const Partida = require('../models/Partida');
const router = express.Router();

// Agendar partida
router.post('/partidas', async (req, res) => {
  const { jogador1_id, jogador2_id, data, mesa } = req.body;
  try {
    const partida = await Partida.agendar(jogador1_id, jogador2_id, data, mesa);
    res.status(201).json(partida);
  } catch (error) {
    res.status(500).json({ error: 'Erro ao agendar partida' });
  }
});

// Listar partidas
router.get('/partidas', async (req, res) => {
  try {
    const partidas = await Partida.listar();
    res.status(200).json(partidas);
  } catch (error) {
    res.status(500).json({ error: 'Erro ao listar partidas' });
  }
});

module.exports = router;