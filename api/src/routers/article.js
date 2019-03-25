/**
 * Created by wenbo.kuang on 2018/8/15
 */
const router = require('koa-router')({
    prefix: '/api/article'
});
const api = require("../controller/article");

module.exports = (app) => {
    router.get("/getArticleList", api.getArticleList);
    router.post("/createArticle", api.createArticle);

    app.use(router.routes());
}