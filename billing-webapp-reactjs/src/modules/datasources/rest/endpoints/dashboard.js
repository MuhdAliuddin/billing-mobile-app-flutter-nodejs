import axios from '../axios_local'
import { DASHBOARD } from '../api'

export const getDashboardAPI = async () => {
  try {
    let response = await axios.get(DASHBOARD.GETDASHBOARD)

    return Promise.resolve(response)
  } catch (e) {
    return Promise.reject(e)
  }
}




