import { combineReducers } from 'redux'

import layout from './layout/reducer'
import login from './login/reducer'
import { dashboardData } from './home/dashboard/reducer'

export default combineReducers({
  layout,
  login,
  dashboardData,
})
