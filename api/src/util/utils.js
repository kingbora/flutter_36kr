const fs = require("fs");
const path = require("path");

const baseRgx = /(.*).(js)$/;

const utils = {
    walk: (wpath, type, excludeDir, callback) => {
        let stype = type.slice(-1) === "s" ? type.slice(0, -1) : type;
        let rgx = new RegExp(stype + '.(js)$', 'i');
        if (!fs.existsSync(wpath)) return;
        fs.readdirSync(wpath).forEach((file) => {
            let newPath = path.join(wpath, file);
            let stat = fs.statSync(newPath);
            if (stat.isFile() && (rgx.test(file) || (baseRgx.test(file)) && newPath.indexOf(type) >= 0)) {
                callback(newPath);
            } else if (stat.isDirectory() && file !== excludeDir && ~newPath.indexOf(type)) {
                utils.walk(newPath, type, excludeDir, callback);
            }
        })
    },
    log: (...msg) => {
        console.log("<---------------------->");
        console.log(...msg);
        console.log("<---------------------->");
    }
};

module.exports = utils;