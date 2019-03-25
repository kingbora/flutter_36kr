/**
 * Created by wenbo.kuang on 2018/8/15
 */
const entity = require('../../model/tb_articles');
const statusCode = require("../../util/status_code");
const utils = require("../../util/utils");

exports.getArticleList = async ctx => {
    utils.log(ctx.request.querystring);
    const param = {
        page: 1,
        pageSize: 10
    };
    await entity.findAll(param).then((result) => {
        ctx.body = result;
    }).catch((err) => {
        utils.log(err);
        ctx.body = statusCode.ERROR_500(err);
    })
};

exports.createArticle = async ctx => {
    let { title, content, userId } = ctx.request.body;

    await entity.create({
        title: title,
        content: content,
        uid: userId
    }).then(() => {
        
    }).catch(() => {
        ctx.body = statusCode.ERROR_500(err);
    })
}