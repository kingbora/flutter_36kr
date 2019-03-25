/**
 * Created by wenbo.kuang on 2018/8/15
 */
const Koa = require("koa");
const path = require("path");
const bodyParser = require("koa-bodyparser");
const staticCache = require("koa-static-cache");
const json = require("koa-json");
const logger = require("koa-logger");
const convert = require("koa-convert");
const config = require('./config');
const utils = require("./util/utils");

//链接数据库
require("./mysql/connector");

const app = new Koa();

//middleware
app.use(convert(bodyParser()));
app.use(convert(json()));
app.use(convert(logger()));

//cache
app.use(convert(staticCache(path.join(__dirname, '../public'), { dynamic: true }, {
    maxAge: 356 * 24 * 60 * 60
})));

function bootstrapRoutes() {
    const appPath = process.cwd();

    utils.walk(appPath + "/src", 'routers', '', function (path) {
        console.log(path);
        require(path)(app);
    });
}

bootstrapRoutes();

app.listen(config.port);

console.log(`listening on port ${config.port}`);