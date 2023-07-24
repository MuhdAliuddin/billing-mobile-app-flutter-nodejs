import axios from '../axios_local'
import { USERS } from '../api'

export const loginApi = async (credential) => {
  try {
    let response = await axios.post(USERS.LOGIN, credential)
    let result = {
      token: response.token ? response.data.token : response.data.id ? response.data.id : '',
      name: response.data.name ? response.data.name : '',
      uid: response.data.uid ? response.data.uid : '',
      role: response.data.role ? response.data.role : '',
      contact: response.data.contact ? response.data.contact : '',
      created: response.data.created,
    }
    return Promise.resolve(result)
  } catch (e) {
    return Promise.reject(e)
  }
}

export const logoutApi = async () => {
  try {
    await axios.post(USERS.LOGOUT)
    return Promise.resolve()
  } catch (e) {
    return Promise.reject(e)
  }
}
