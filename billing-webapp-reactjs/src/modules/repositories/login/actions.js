import ACTION, { LOGIN_STATE } from './creator'
import { getLogin, setLogin, clrLogin } from '../../datasources/storage/api/login'

import { loginApi, logoutApi } from '../../datasources/mock/users'
// import { loginApi, logoutApi } from '../../datasources/rest/endpoints/users'

export const authorizing = () => (dispatch) => {
  dispatch({
    type: ACTION.LOGIN.PENDING,
    payload: {
      status: LOGIN_STATE.IN_PROGRESS,
      message: '',
    },
  })
  let credential = getLogin()
  if (credential == null) {
    return dispatch({
      type: ACTION.LOGIN.FAILURE,
      payload: { credential: {}, status: LOGIN_STATE.UNAUTHORIZED, message: 'Application Reset' },
    })
  }
  dispatch({
    type: ACTION.LOGIN.SUCCESS,
    payload: {
      credential: credential,
      status: LOGIN_STATE.AUTHORIZED,
      message: '',
    },
  })
}

export const login = (email, password) => async (dispatch) => {
  dispatch({
    type: ACTION.LOGIN.PENDING,
    payload: {
      status: LOGIN_STATE.IN_PROGRESS,
      message: '',
    },
  })
  try {
    let credential = await loginApi({
      email,
      password,
    })
    setLogin(credential)
    dispatch({
      type: ACTION.LOGIN.SUCCESS,
      payload: {
        credential: credential,
        status: LOGIN_STATE.AUTHORIZED,
        message: '',
      },
    })
  } catch (e) {
    return dispatch({
      type: ACTION.LOGIN.FAILURE,
      payload: { credential: {}, status: LOGIN_STATE.ERROR, message: e },
    })
  }
}

export const logout = () => async (dispatch) => {
  dispatch({
    type: ACTION.LOGOUT.PENDING,
    payload: {
      status: LOGIN_STATE.IN_PROGRESS,
      message: '',
    },
  })
  await logoutApi()
  clrLogin()
  dispatch({
    type: ACTION.LOGOUT.SUCCESS,
    payload: {
      status: LOGIN_STATE.UNAUTHORIZED,
      message: '',
    },
  })
}

const LoginAction = {
  authorizing,
  login,
  logout,
}

export default LoginAction
