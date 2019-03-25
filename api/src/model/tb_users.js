const Seq = require("sequelize");
const db = require("../mysql/connector");

const Users = db.define("tb_users", {
    id: {
        type: Seq.INTEGER,
        primaryKey: true,
        unique: true,
        autoIncrement: true,
        allowNull: false,
        comment: '主键'
    },
    username: {
        type: Seq.STRING,
        allowNull: false,
        comment: '用户名'
    },
    phone: {
        type: Seq.STRING(20),
        allowNull: false,
        comment: '手机号'
    },
    password: {
        type: Seq.STRING(50),
        allowNull: false,
        comment: '密码'
    },
    birth: {
        type: Seq.STRING(13),
        comment: '生日'
    },
    gender: {
        type: Seq.ENUM,
        values: ['male', 'female', 'secrecy'],
        defaultValue: 'secrecy',
        comment: '性别'
    },
    avator: {
        type: Seq.STRING,
        comment: '头像'
    },
    profession: {
        type: Seq.SMALLINT,
        comment: '职业'
    },
    field: {
        type: Seq.SMALLINT,
        comment: '行业'
    },
    description: {
        type: Seq.TEXT,
        comment: '个人简介'
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

Users.sync();

module.exports = Users;