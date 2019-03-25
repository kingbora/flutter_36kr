const Seq = require("sequelize");
const config = require("../config");
const utils = require("../util/utils");

const connection = new Seq(
    config.db.database,
    config.db.username,
    config.db.password,
    {
        host: config.db.host,
        port: config.db.port,
        dialect: config.db.dialect,
        logging: config.db.log
    }
);

connection.authenticate().then(() => {
    utils.log("database connected!");
}).catch(err => {
    utils.log("ERROR -- Unable to connect to the database:", err);
});

console.log(123);

connection.sync();

module.exports = connection;