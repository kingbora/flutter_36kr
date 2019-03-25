const Professions = require("../model/tb_professions");

const findAll = ({page = 1, pageSize = 10, ...otherOptions} = {}) => {
    return Professions.findAll({
        limit: Number(pageSize),
        offset: (Number(page) - 1) * Number(pageSize),
        where: {
            ...otherOptions
        }
    });
};

const create = (entity) => {
    return Professions.create(entity);
};

const update = (entity) => {
    return Professions.update(entity, {
        where: {
            id: entity.id
        }
    });
};

const del = (id) => {
    return Professions.destroy({
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