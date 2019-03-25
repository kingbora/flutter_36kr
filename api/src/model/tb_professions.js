const Seq = require("sequelize");
const db = require("../mysql/connector");

const Profession = db.define("tb_professions", {
    id: {
        type: Seq.SMALLINT,
        primaryKey: true,
        unique: true,
        autoIncrement: true,
        allowNull: false,
        comment: '主键'
    },
    title: {
        type: Seq.STRING,
        unique: true,
        allowNull: false,
        comment: '职业名称'
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

Profession.sync();

module.exports = Profession;