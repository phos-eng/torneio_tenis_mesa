const pool = require('../config/db');

const Jogador = {
  async criar(nome, idade, ranking, clube) {
    const query = `
      INSERT INTO jogadores (nome, idade, ranking, clube)
      VALUES ($1, $2, $3, $4)
      RETURNING *;
    `;
    const values = [nome, idade, ranking, clube];
    const { rows } = await pool.query(query, values);
    return rows[0];
  },

  async listar() {
    const { rows } = await pool.query('SELECT * FROM jogadores;');
    return rows;
  },
};

module.exports = Jogador;