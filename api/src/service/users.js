const Users = require("../model/tb_users");

const findAll = ({page = 1, pageSize = 10, ...otherOptions} = {}) => {
    return Users.findAll({
        limit: Number(pageSize),
        offset: (Number(page) - 1) * Number(pageSize),
        where: {
            ...otherOptions
        }
    });
};

const create = (entity) => {
    return Users.create(entity);
};

const update = (entity) => {
    return Users.update(entity, {
        where: {
            id: entity.id
        }
    });
};

const del = (id) => {
    return Users.destroy({
        where: {
            ...id
        }
    });
};

module.exports = {
    findAll: findAll,
    create: create,
    update: update,
    delete: del
};