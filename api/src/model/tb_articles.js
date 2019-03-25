const Seq = require("sequelize");
const db = require("../mysql/connector");
const md = require("markdown-it")();

const Articles = db.define("tb_articles", {
    id: {
        type: Seq.INTEGER,
        primaryKey: true,
        unique: true,
        autoIncrement: true,
        allowNull: false,
        comment: '主键'
    },
    uid: {
        type: Seq.INTEGER,
        allowNull: false,
        comment: '用户ID'
    },
    title: {
        type: Seq.TEXT('tiny'),
        allowNull: false,
        comment: '标题'
    },
    content: {
        type: Seq.TEXT,
        allowNull: false,
        comment: '内容',
        get() {
            return md.render(content);
        }
    },
    favorites: {
        type: Seq.INTEGER,
        defaultValue: 0,
        comment: '收藏人数'
    },
    likes: {
        type: Seq.INTEGER,
        defaultValue: 0,
        comment: '点赞人数'
    },
    browses: {
        type: Seq.INTEGER,
        defaultValue: 0,
        comment: '浏览量'
    }
}, {
    //添加时间戳属性（updatedAt, createdAt）
    timestamps: true,
    // //不删除数据库条目，但将新添加的属性deletedAt设置为当前日期（删除完成时）。
    // //paranoid只有在启用时间戳时才能工作
    // paranoid: true,
    //将自动设置所有属性的字段选项为下划线命名方式
    //不会覆盖已经定义的字段选项
    underscored: true,
    //禁止修改表明；默认情况下，sequelize将自动将所有传递的模型名称（define的第一个参数）转为复数。
    freezeTableName: true
});

Articles.sync();

module.exports = Articles;