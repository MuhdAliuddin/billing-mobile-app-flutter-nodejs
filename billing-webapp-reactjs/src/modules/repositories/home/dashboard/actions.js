import ACTION, { DASHBOARD_STATE } from './creator'

import { getDashboardApi } from '../../../datasources/mock/dashboard'

export const getDashboard = () => async (dispatch) => {
  try {
    // let dom_species_data = await getDashboardApi()
    let dashboard_data = await getDashboardApi()

    dispatch({
      type: ACTION.DASHBOARD.SUCCESS,
      payload: {
        status: DASHBOARD_STATE.SUCCESS,
        payload: { dashboardData: dashboard_data, status: DASHBOARD_STATE.SUCCESS, message: 'Dominant Species Retrieved' }
      }
    })
  } catch (e) {
    return dispatch({
      type: ACTION.DASHBOARD.FAILURE,
      payload: { dashboardData: {}, status: DASHBOARD_STATE.ERROR, message: e },
    })
  }
}


const DashboardAction = {
  getDashboard,
}

export default DashboardAction
