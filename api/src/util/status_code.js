const statusCode = {
    ERROR_401: (msg) => {
        return {
            code: 401,
            msg
        };
    },
    ERROR_403: (msg) => {
        return {
            code: 403,
            msg
        }
    },
    ERROR_500: (msg) => {
        return {
            code: 500,
            msg
        }
    },
    SUCCESS_200: (data, msg) => {
        return {
            code: 200,
            msg,
            data
        }
    }
}

module.exports = statusCode;