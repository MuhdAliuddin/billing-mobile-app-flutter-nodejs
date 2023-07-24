import ACTION, { DASHBOARD_STATE } from './creator'

const init = {
  dashboardData: {},
  status: DASHBOARD_STATE.PENDING,
  message: '',
}

export const dashboardData = (state = init, { type, payload }) => {
  switch (type) {
    case ACTION.DASHBOARD.PENDING:
    case ACTION.DASHBOARD.SUCCESS:
    case ACTION.DASHBOARD.FAILURE:
      return { ...state, ...payload }
    default:
      return state
  }
}

