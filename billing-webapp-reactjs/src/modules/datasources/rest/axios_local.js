import axios from 'axios'
import { getLogin } from '../storage/api/login'

const instance = axios.create({
  baseURL: 'http://localhost:3309',
  withCredentials: false,
})

instance.interceptors.request.use(
  (req) => {
    const credential = getLogin()
    req['headers']['authorization'] = credential ? credential.token : ''
    req['headers']['Access-Control-Allow-Origin'] = '*'
    req['headers']['Access-Control-Allow-Methods'] = 'GET,PUT,POST,DELETE,PATCH,OPTIONS'
    return req
  },
  (error) => {
    console.warn('axios.request.error :\n' + error)
    return Promise.reject(error)
  },
)

instance.interceptors.response.use(
  (res) => {
    return res
  },
  (error) => {
    console.warn('axios.response.error:\n', error)
    return Promise.reject(error)
  },
)

export default instance
