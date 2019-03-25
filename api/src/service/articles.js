const Articles = require("../model/tb_articles");

const findAll = ({page = 1, pageSize = 10, ...otherOptions} = {}) => {
    return Articles.findAll({
        limit: Number(pageSize),
        offset: (Number(page) - 1) * Number(pageSize),
        where: {
            ...otherOptions
        }
    });
};

const create = (entity) => {
    return Articles.create(entity);
};

const update = (entity) => {
    return Articles.update(entity, {
        where: {
            id: entity.id
        }
    });
};

const del = (id) => {
    return Articles.destroy({
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