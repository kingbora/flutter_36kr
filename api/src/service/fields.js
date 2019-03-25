const Fields = require("../model/tb_fields");

const findAll = ({page = 1, pageSize = 10, ...otherOptions} = {}) => {
    return Fields.findAll({
        limit: Number(pageSize),
        offset: (Number(page) - 1) * Number(pageSize),
        where: {
            ...otherOptions
        }
    });
};

const create = (entity) => {
    return Fields.create(entity);
};

const update = (entity) => {
    return Fields.update(entity, {
        where: {
            id: entity.id
        }
    });
};

const del = (id) => {
    return Fields.destroy({
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