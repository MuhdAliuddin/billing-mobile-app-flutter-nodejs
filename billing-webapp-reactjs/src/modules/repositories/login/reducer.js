import ACTION, { LOGIN_STATE } from './creator'

const init = {
  credential: {},
  status: LOGIN_STATE.REFRESHED,
  message: '',
}

const Login = (state = init, { type, payload }) => {
  switch (type) {
    case ACTION.LOGIN.PENDING:
    case ACTION.LOGIN.SUCCESS:
    case ACTION.LOGIN.FAILURE:
    case ACTION.LOGOUT.PENDING:
    case ACTION.LOGOUT.SUCCESS:
    case ACTION.LOGOUT.FAILURE:
      return { ...state, ...payload }
    default:
      return state
  }
}

export default Login
