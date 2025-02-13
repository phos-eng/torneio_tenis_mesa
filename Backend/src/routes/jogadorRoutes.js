const express = require('express');
const Jogador = require('../models/Jogador');
const router = express.Router();

// Cadastrar jogador
router.post('/jogadores', async (req, res) => {
  const { nome, idade, ranking, clube } = req.body;
  try {
    const jogador = await Jogador.criar(nome, idade, ranking, clube);
    res.status(201).json(jogador);
  } catch (error) {
    res.status(500).json({ error: 'Erro ao cadastrar jogador' });
  }
});

// Listar jogadores
router.get('/jogadores', async (req, res) => {
  try {
    const jogadores = await Jogador.listar();
    res.status(200).json(jogadores);
  } catch (error) {
    res.status(500).json({ error: 'Erro ao listar jogadores' });
  }
});

module.exports = router;