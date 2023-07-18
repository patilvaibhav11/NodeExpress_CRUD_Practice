const { get } = require('express/lib/response')
var dbConn = require('../../config/db.config')

// Admin Login 

module.exports.adminLoginService = (body) => {
    const 
    {
        Phone_no, 
        Password 
    } = body
    return new Promise((resolve, reject) => {
        const getQuery = `
        SELECT 
        u.user_id,
        u.user_name,
        u.mobile_no,
        u.password,
        u.email_id,
        u.address,
        u.state_id,
        u.city_id,
        u.gender,
        u.hobbies_id,
        u.status
        FROM tb_user_master as u
        WHERE 
        u.mobile_no = '${Phone_no}' 
        AND
        u.password = '${Password}'
        AND
        u.status = '1';
        `
        dbConn.query(getQuery, (getErr, getRow) => {
            if (getErr) {
                reject({
                    ack: false,
                    resCode: -1,
                    resCode: getErr.errno,
                    msg: getErr.sqlMessage
                })
            }
            else if (getRow.length === 0) {
                reject({
                    ack: false,
                    resCode: -2,
                    msg: "You are not authorized User"
                })
            } else {
                resolve({
                    ack: true,
                    resCode: 1,
                    data: getRow[0],
                    msg: 'Login Successfully'
                })
            }

        })
    })
}

module.exports.adminDetailsService = () => {
    return new Promise((resolve, reject) => {
        const getQuery = `
        SELECT 
        u.user_id,
        u.user_name,
        u.mobile_no,
        u.password,
        u.email_id,
        u.address,
        u.state_id,
        u.city_id,
        u.gender,
        u.hobbies_id,
        u.status
        FROM tb_user_master as u;`

        dbConn.query(getQuery, (getErr, getRow) => {
            if (getErr) {
                reject({
                    ack: false,
                    resCode: getErr.errno,
                    msg: getErr.sqlMessage
                })
            } else if (getRow.length === 0) {
                reject({
                    ack: false,
                    resCode: -2,
                    msg: "No Rows Found"
                })
            } resolve({
                ack: true,
                resCode: 1,
                data: getRow,
                msg: "Admin Data Found"
            })
        })
    })
}

module.exports.adminUpdateService = (data) => {
    const
    {
        User_Id,
        User_name,
        Mobile_no,
        Password,
        Email,
        Address,
        State_id,
        City_id,
        Gender,
        Hobbie_id
    } = data
    return new Promise((resolve, reject) => {
        const getQuery = `
        UPDATE 
        tb_user_master
        SET 
        user_name = '${User_name}',
        mobile_no = '${Mobile_no}',
        password = '${Password}',
        email_id = '${Email}',
        address = '${Address}',
        state_id = '${State_id}',
        city_id = '${City_id}',
        gender = '${Gender}',
        hobbies_id = '${Hobbie_id}'
        WHERE user_id = '${User_Id}'`

        dbConn.query(getQuery, (getErr, getRow) => {
            if (getErr) {
                reject({
                    ack: false,
                    resCode: getErr.errno,
                    msg: getErr.sqlMessage
                })
            }
            else if (getRow.length === 0) {
                reject({
                    ack: false,
                    resCode: 1,
                    msg: "Data Not Found"
                })
            }
            resolve({
                ack: true,
                resCode: 1,
                msg: "Data Updated Sucessfully"
            })
        })
    })
}


module.exports.adminDeleteService = (data) => {
    const 
    {
        user_id
    } = data
    return new Promise((resolve, reject) =>{
    const getQuery = `
    DELETE 
    FROM tb_user_master 
    WHERE user_id = ${user_id}
    `
    dbConn.query(getQuery ,(getErr, getRow) => {
        if(getErr){
            reject({
                ack:false,
                resCode:getErr.errno,
                msg:getErr.sqlMessage
            })
        }
        else if(getRow.length === 0){
            reject({
                ack:false,
                resCode:-2,
                msg:"No Data Found"
            })
        }else{
            resolve({
                ack:true,
                resCode:1,
                msg:"Data Deleted Sucessfully"
            })
        }
    })
    })
    
}
module.exports.adminState = () => {
    return new Promise((resolve, reject) => {
        const getQuery = `
        SELECT 
        s.state_id,
        s.state_name,
        s.status 
        FROM tb_state_master as s
        WHERE s.status = '1'
       `

        dbConn.query(getQuery, (getErr, getRow) => {
            if (getErr) {
                reject({
                    ack: false,
                    resCode: getErr.errno,
                    msg: getErr.sqlMessage
                })
            } else if (getRow.length === 0) {
                reject({
                    ack: false,
                    resCode: -2,
                    msg: "No Rows Found"
                })
            } resolve({
                ack: true,
                resCode: 1,
                data: getRow,
                msg: "Admin Data Found"
            })
        })
    })
}
module.exports.adminCity = (body) => {
    const {state_id} = body
    return new Promise((resolve, reject) => {
        const getQuery = `
        SELECT 
            c.city_id,
            c.state_id,
            c.city_name,
            c.status
            FROM tb_city_master as c
            WHERE c.status = '1'
            AND
            c.state_id = ${state_id};
                    `

        dbConn.query(getQuery, (getErr, getRow) => {
            if (getErr) {
                reject({
                    ack: false,
                    resCode: getErr.errno,
                    msg: getErr.sqlMessage
                })
            } else if (getRow.length === 0) {
                reject({
                    ack: false,
                    resCode: -2,
                    msg: "No Rows Found"
                })
            } resolve({
                ack: true,
                resCode: 1,
                data: getRow,
                msg: "Admin Data Found"
            })
        })
    })
}
module.exports.adminRegestration = (body) => {
    const {
        user_name,
        mobile_no,
        password,
        email_id,
        address,
        state_id,
        city_id,
        gender,
        hobbies_id
    } = body
    return new Promise((resolve, reject) => {
        const getQuery = `
        INSERT INTO 
        tb_user_master (
            user_name, 
            mobile_no, 
            password, 
            email_id, 
            address, 
            state_id, 
            city_id, 
            gender, 
            hobbies_id, 
            status) VALUES (
                '${user_name}',
                '${mobile_no}',
                '${password}',
                '${email_id}',
                '${address}',
                '${state_id}',
                '${city_id}',
                '${gender}',
                '${hobbies_id}',
            )
                    `

        dbConn.query(getQuery, (getErr, getRow) => {
            if (getErr) {
                reject({
                    ack: false,
                    resCode: getErr.errno,
                    msg: getErr.sqlMessage
                })
            } else if (getRow.length === 0) {
                reject({
                    ack: false,
                    resCode: -2,
                    msg: "No Rows Found"
                })
            } resolve({
                ack: true,
                resCode: 1,
                data: getRow,
                msg: "Admin Data Found"
            })
        })
    })
}



