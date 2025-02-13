const pool = require('../config/db');

const Partida = {
  async agendar(jogador1_id, jogador2_id, data, mesa) {
    const query = `
      INSERT INTO partidas (jogador1_id, jogador2_id, data, mesa)
      VALUES ($1, $2, $3, $4)
      RETURNING *;
    `;
    const values = [jogador1_id, jogador2_id, data, mesa];
    const { rows } = await pool.query(query, values);
    return rows[0];
  },

  async listar() {
    const { rows } = await pool.query('SELECT * FROM partidas;');
    return rows;
  },
};

module.exports = Partida;